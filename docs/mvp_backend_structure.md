# Smart Tourist Safety System - MVP Backend Structure Document

## Overview
This document outlines the simplified backend architecture for the MVP (Minimum Viable Product) of the Smart Tourist Safety System. The MVP focuses on core functionality: tourist registration, IoT band integration, real-time monitoring, and emergency SOS alerts using Firebase as the primary backend platform.

---

## MVP Architecture Components

### 1. Firebase Services Configuration (MVP Focused)

#### 1.1 Core Firebase Services
```yaml
Firebase Services (MVP):
  - Authentication: Phone/OTP verification
  - Firestore: Real-time database for tourist data and alerts
  - Cloud Functions: API endpoints and event handlers
  - Cloud Storage: Basic file storage for profile images
  - Cloud Messaging: Push notifications for SOS alerts
  - Hosting: Dashboard deployment
```

#### 1.2 Simplified Database Schema (MVP)

**Firestore Collections:**
```javascript
// tourists/{touristId}
{
  id: "auto_generated_uuid",
  personalInfo: {
    phone: "+91xxxxxxxxxx",
    name: "Tourist Name", // Not encrypted in MVP
    emergencyContact: "+91xxxxxxxxxx"
  },
  digitalId: {
    touristId: "uuid",
    qrCode: "base64_qr", // Simple QR generation
    issuedAt: "timestamp"
  },
  status: "ACTIVE|INACTIVE|EMERGENCY",
  currentLocation: {
    latitude: 26.2041,
    longitude: 94.2095,
    timestamp: "timestamp"
  },
  connectedDevice: "device_id_or_null",
  createdAt: "timestamp",
  updatedAt: "timestamp"
}

// devices/{deviceId}
{
  deviceId: "ble_device_id",
  touristId: "uuid",
  deviceType: "IOT_BAND",
  batteryLevel: 85,
  isConnected: true,
  lastSeen: "timestamp",
  status: "PAIRED|UNPAIRED"
}

// telemetry/{touristId}/readings/{readingId}
{
  touristId: "uuid",
  deviceId: "ble_device_id",
  timestamp: "2025-09-09T12:34:56Z",
  location: {
    latitude: 26.2041,
    longitude: 94.2095
  },
  vitals: {
    heartRate: 82 // Primary vital for MVP
  },
  motion: {
    activity: "WALKING|STATIONARY|FALL"
  },
  source: "MOBILE_APP|IOT_BAND"
}

// alerts/{alertId}
{
  alertId: "auto_generated_uuid",
  touristId: "uuid",
  alertType: "SOS", // Only SOS for MVP
  status: "ACTIVE|ACKNOWLEDGED|RESOLVED",
  location: {
    latitude: 26.2041,
    longitude: 94.2095
  },
  vitals: {
    heartRate: 82
  },
  createdAt: "timestamp",
  acknowledgedAt: "timestamp",
  resolvedAt: "timestamp",
  resolvedBy: "authority_id"
}

// geofences/{fenceId} - Simplified for MVP
{
  fenceId: "uuid",
  name: "Restricted Area 1",
  type: "RESTRICTED", // Only restricted zones for MVP
  coordinates: [
    [longitude, latitude],
    [longitude, latitude],
    // Polygon points
  ],
  isActive: true
}

// authorities/{authorityId} - Simple auth for MVP
{
  authorityId: "uuid",
  email: "officer@police.gov.in",
  name: "Officer Name",
  role: "POLICE", // Simple role system
  createdAt: "timestamp"
}
```

### 2. Cloud Functions Structure (MVP)

```javascript
// functions/src/index.js
const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

// Tourist API endpoints
exports.createTourist = functions.https.onCall(require('./api/createTourist'));
exports.updateLocation = functions.https.onCall(require('./api/updateLocation'));
exports.triggerSOS = functions.https.onCall(require('./api/triggerSOS'));

// Device management
exports.pairDevice = functions.https.onCall(require('./api/pairDevice'));

// Real-time triggers
exports.onSOSCreated = functions.firestore
  .document('alerts/{alertId}')
  .onCreate(require('./triggers/onSOSCreated'));

exports.onLocationUpdate = functions.firestore
  .document('tourists/{touristId}')
  .onUpdate(require('./triggers/onLocationUpdate'));

// Scheduled functions
exports.cleanupOldData = functions.pubsub
  .schedule('0 2 * * *') // Daily cleanup
  .onRun(require('./schedulers/cleanup'));
```

#### 2.1 API Functions Implementation

```javascript
// functions/src/api/createTourist.js
const { v4: uuidv4 } = require('uuid');

exports.createTourist = async (data, context) => {
  try {
    // Validate auth
    if (!context.auth) {
      throw new functions.https.HttpsError('unauthenticated', 'User must be authenticated');
    }

    const touristId = uuidv4();
    const qrCode = await generateQRCode(touristId);

    const touristData = {
      id: touristId,
      personalInfo: {
        phone: data.phone,
        name: data.name,
        emergencyContact: data.emergencyContact
      },
      digitalId: {
        touristId,
        qrCode,
        issuedAt: admin.firestore.FieldValue.serverTimestamp()
      },
      status: 'ACTIVE',
      currentLocation: null,
      connectedDevice: null,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    };

    await admin.firestore().collection('tourists').doc(touristId).set(touristData);

    return {
      success: true,
      touristId,
      qrCode
    };

  } catch (error) {
    console.error('Error creating tourist:', error);
    throw new functions.https.HttpsError('internal', 'Failed to create tourist profile');
  }
};

async function generateQRCode(touristId) {
  const QRCode = require('qrcode');
  return await QRCode.toDataURL(touristId);
}
```

```javascript
// functions/src/api/triggerSOS.js
exports.triggerSOS = async (data, context) => {
  try {
    if (!context.auth) {
      throw new functions.https.HttpsError('unauthenticated', 'User must be authenticated');
    }

    const { touristId, location, vitals } = data;
    const alertId = uuidv4();

    const alertData = {
      alertId,
      touristId,
      alertType: 'SOS',
      status: 'ACTIVE',
      location,
      vitals: vitals || {},
      createdAt: admin.firestore.FieldValue.serverTimestamp()
    };

    // Create alert
    await admin.firestore().collection('alerts').doc(alertId).set(alertData);

    // Update tourist status
    await admin.firestore().collection('tourists').doc(touristId).update({
      status: 'EMERGENCY',
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    });

    return {
      success: true,
      alertId
    };

  } catch (error) {
    console.error('Error triggering SOS:', error);
    throw new functions.https.HttpsError('internal', 'Failed to trigger SOS alert');
  }
};
```

```javascript
// functions/src/api/pairDevice.js
exports.pairDevice = async (data, context) => {
  try {
    if (!context.auth) {
      throw new functions.https.HttpsError('unauthenticated', 'User must be authenticated');
    }

    const { touristId, deviceId } = data;

    const deviceData = {
      deviceId,
      touristId,
      deviceType: 'IOT_BAND',
      batteryLevel: 100, // Default
      isConnected: true,
      lastSeen: admin.firestore.FieldValue.serverTimestamp(),
      status: 'PAIRED'
    };

    // Create/update device
    await admin.firestore().collection('devices').doc(deviceId).set(deviceData);

    // Update tourist with connected device
    await admin.firestore().collection('tourists').doc(touristId).update({
      connectedDevice: deviceId,
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    });

    return {
      success: true,
      message: 'Device paired successfully'
    };

  } catch (error) {
    console.error('Error pairing device:', error);
    throw new functions.https.HttpsError('internal', 'Failed to pair device');
  }
};
```

#### 2.2 Real-time Triggers

```javascript
// functions/src/triggers/onSOSCreated.js
const admin = require('firebase-admin');

exports.onSOSCreated = async (snap, context) => {
  try {
    const alertData = snap.data();
    const { touristId, location } = alertData;

    // Get tourist details
    const touristDoc = await admin.firestore().collection('tourists').doc(touristId).get();
    const touristData = touristDoc.data();

    // Send push notifications to all connected dashboard users
    const message = {
      notification: {
        title: '🚨 SOS Alert',
        body: `Emergency from ${touristData.personalInfo.name} at ${location.latitude}, ${location.longitude}`
      },
      data: {
        alertId: alertData.alertId,
        touristId: touristId,
        type: 'SOS_ALERT'
      }
    };

    // Send to topic (all dashboard users subscribe to 'sos-alerts' topic)
    await admin.messaging().sendToTopic('sos-alerts', message);

    console.log('SOS alert notification sent successfully');

  } catch (error) {
    console.error('Error handling SOS alert:', error);
  }
};
```

```javascript
// functions/src/triggers/onLocationUpdate.js
exports.onLocationUpdate = async (change, context) => {
  try {
    const before = change.before.data();
    const after = change.after.data();

    // Check if location actually changed
    if (!after.currentLocation || 
        (before.currentLocation && 
         before.currentLocation.latitude === after.currentLocation.latitude &&
         before.currentLocation.longitude === after.currentLocation.longitude)) {
      return;
    }

    const touristId = context.params.touristId;
    const location = after.currentLocation;

    // Check geofences
    const restrictedArea = await checkGeofences(location);
    
    if (restrictedArea) {
      // Send warning notification to tourist
      await sendGeofenceAlert(touristId, restrictedArea);
    }

    // Store location in telemetry
    await admin.firestore()
      .collection('telemetry')
      .doc(touristId)
      .collection('readings')
      .add({
        touristId,
        timestamp: admin.firestore.FieldValue.serverTimestamp(),
        location,
        source: 'MOBILE_APP'
      });

  } catch (error) {
    console.error('Error processing location update:', error);
  }
};

async function checkGeofences(location) {
  const geofences = await admin.firestore()
    .collection('geofences')
    .where('isActive', '==', true)
    .get();

  for (const doc of geofences.docs) {
    const fence = doc.data();
    if (isPointInPolygon(location, fence.coordinates)) {
      return fence;
    }
  }
  return null;
}

function isPointInPolygon(point, polygon) {
  // Simple point-in-polygon algorithm for MVP
  const x = point.longitude;
  const y = point.latitude;
  let inside = false;

  for (let i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
    const xi = polygon[i][0], yi = polygon[i][1];
    const xj = polygon[j][0], yj = polygon[j][1];

    if (((yi > y) !== (yj > y)) && (x < (xj - xi) * (y - yi) / (yj - yi) + xi)) {
      inside = !inside;
    }
  }

  return inside;
}

async function sendGeofenceAlert(touristId, restrictedArea) {
  // Get tourist's FCM token (stored during app initialization)
  const touristDoc = await admin.firestore().collection('tourists').doc(touristId).get();
  const fcmToken = touristDoc.data().fcmToken;

  if (fcmToken) {
    const message = {
      token: fcmToken,
      notification: {
        title: '⚠️ Warning',
        body: `You have entered a restricted area: ${restrictedArea.name}`
      },
      data: {
        type: 'GEOFENCE_ALERT',
        areaName: restrictedArea.name
      }
    };

    await admin.messaging().send(message);
  }
}
```

### 3. Dashboard Backend (Simplified Node.js)

#### 3.1 Dashboard API Structure
```javascript
// dashboard/server.js
const express = require('express');
const admin = require('firebase-admin');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Initialize Firebase Admin
admin.initializeApp({
  credential: admin.credential.applicationDefault()
});

// Middleware
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Authentication middleware
const authenticateUser = async (req, res, next) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    const decodedToken = await admin.auth().verifyIdToken(token);
    req.user = decodedToken;
    next();
  } catch (error) {
    res.status(401).json({ error: 'Unauthorized' });
  }
};

// API Routes
app.get('/api/tourists', authenticateUser, require('./routes/tourists'));
app.get('/api/alerts', authenticateUser, require('./routes/alerts'));
app.put('/api/alerts/:id', authenticateUser, require('./routes/updateAlert'));

// Serve dashboard HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
  console.log(`Dashboard server running on port ${port}`);
});
```

#### 3.2 API Routes Implementation
```javascript
// dashboard/routes/tourists.js
const admin = require('firebase-admin');

module.exports = async (req, res) => {
  try {
    const touristsSnapshot = await admin.firestore()
      .collection('tourists')
      .where('status', '!=', 'INACTIVE')
      .get();

    const tourists = [];
    touristsSnapshot.forEach(doc => {
      const data = doc.data();
      tourists.push({
        id: data.id,
        name: data.personalInfo.name,
        phone: data.personalInfo.phone,
        status: data.status,
        currentLocation: data.currentLocation,
        connectedDevice: data.connectedDevice,
        lastUpdated: data.updatedAt
      });
    });

    res.json({
      success: true,
      tourists
    });

  } catch (error) {
    console.error('Error fetching tourists:', error);
    res.status(500).json({ error: 'Failed to fetch tourists' });
  }
};
```

```javascript
// dashboard/routes/alerts.js
const admin = require('firebase-admin');

module.exports = async (req, res) => {
  try {
    const alertsSnapshot = await admin.firestore()
      .collection('alerts')
      .where('status', 'in', ['ACTIVE', 'ACKNOWLEDGED'])
      .orderBy('createdAt', 'desc')
      .limit(50)
      .get();

    const alerts = [];
    
    for (const doc of alertsSnapshot.docs) {
      const alertData = doc.data();
      
      // Get tourist details
      const touristDoc = await admin.firestore()
        .collection('tourists')
        .doc(alertData.touristId)
        .get();
      
      const touristData = touristDoc.data();

      alerts.push({
        alertId: alertData.alertId,
        touristId: alertData.touristId,
        touristName: touristData.personalInfo.name,
        touristPhone: touristData.personalInfo.phone,
        alertType: alertData.alertType,
        status: alertData.status,
        location: alertData.location,
        vitals: alertData.vitals,
        createdAt: alertData.createdAt,
        emergencyContact: touristData.personalInfo.emergencyContact
      });
    }

    res.json({
      success: true,
      alerts
    });

  } catch (error) {
    console.error('Error fetching alerts:', error);
    res.status(500).json({ error: 'Failed to fetch alerts' });
  }
};
```

```javascript
// dashboard/routes/updateAlert.js
const admin = require('firebase-admin');

module.exports = async (req, res) => {
  try {
    const alertId = req.params.id;
    const { status } = req.body;

    if (!['ACKNOWLEDGED', 'RESOLVED'].includes(status)) {
      return res.status(400).json({ error: 'Invalid status' });
    }

    const updateData = {
      status,
      updatedAt: admin.firestore.FieldValue.serverTimestamp()
    };

    if (status === 'ACKNOWLEDGED') {
      updateData.acknowledgedAt = admin.firestore.FieldValue.serverTimestamp();
    } else if (status === 'RESOLVED') {
      updateData.resolvedAt = admin.firestore.FieldValue.serverTimestamp();
      updateData.resolvedBy = req.user.uid;
    }

    await admin.firestore()
      .collection('alerts')
      .doc(alertId)
      .update(updateData);

    // If resolved, update tourist status back to ACTIVE
    if (status === 'RESOLVED') {
      const alertDoc = await admin.firestore().collection('alerts').doc(alertId).get();
      const alertData = alertDoc.data();
      
      await admin.firestore()
        .collection('tourists')
        .doc(alertData.touristId)
        .update({
          status: 'ACTIVE',
          updatedAt: admin.firestore.FieldValue.serverTimestamp()
        });
    }

    res.json({
      success: true,
      message: `Alert ${status.toLowerCase()} successfully`
    });

  } catch (error) {
    console.error('Error updating alert:', error);
    res.status(500).json({ error: 'Failed to update alert' });
  }
};
```

### 4. Real-time Dashboard Frontend (HTML/JS)

#### 4.1 Dashboard HTML Structure
```html
<!-- dashboard/public/index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Tourist Safety Dashboard</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="dashboard-container">
        <header class="header">
            <h1>Smart Tourist Safety Dashboard</h1>
            <div class="user-info">
                <span id="user-name">Officer Name</span>
                <button onclick="logout()">Logout</button>
            </div>
        </header>

        <div class="main-content">
            <div class="map-container">
                <div id="map"></div>
            </div>

            <div class="sidebar">
                <div class="alerts-panel">
                    <h3>Active Alerts</h3>
                    <div id="alerts-list"></div>
                </div>

                <div class="tourist-info" id="tourist-info" style="display: none;">
                    <h3>Tourist Details</h3>
                    <div id="tourist-details"></div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.0.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.0.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/10.0.0/firebase-firestore.js"></script>
    <script src="dashboard.js"></script>
</body>
</html>
```

#### 4.2 Dashboard JavaScript
```javascript
// dashboard/public/dashboard.js
class DashboardApp {
  constructor() {
    this.map = null;
    this.touristMarkers = new Map();
    this.alertMarkers = new Map();
    this.init();
  }

  async init() {
    this.initMap();
    await this.loadTourists();
    await this.loadAlerts();
    this.setupRealtimeListeners();
  }

  initMap() {
    this.map = L.map('map').setView([26.2041, 94.2095], 10);
    
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(this.map);
  }

  async loadTourists() {
    try {
      const response = await fetch('/api/tourists', {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('authToken')}`
        }
      });
      
      const data = await response.json();
      
      if (data.success) {
        data.tourists.forEach(tourist => this.addTouristMarker(tourist));
      }
    } catch (error) {
      console.error('Error loading tourists:', error);
    }
  }

  async loadAlerts() {
    try {
      const response = await fetch('/api/alerts', {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('authToken')}`
        }
      });
      
      const data = await response.json();
      
      if (data.success) {
        this.updateAlertsList(data.alerts);
        data.alerts.forEach(alert => this.addAlertMarker(alert));
      }
    } catch (error) {
      console.error('Error loading alerts:', error);
    }
  }

  addTouristMarker(tourist) {
    if (!tourist.currentLocation) return;

    const icon = L.divIcon({
      className: `tourist-marker ${tourist.status.toLowerCase()}`,
      html: `<div class="marker-content">${tourist.name[0]}</div>`,
      iconSize: [30, 30]
    });

    const marker = L.marker([
      tourist.currentLocation.latitude,
      tourist.currentLocation.longitude
    ], { icon }).addTo(this.map);

    marker.bindPopup(`
      <div class="tourist-popup">
        <h4>${tourist.name}</h4>
        <p>Phone: ${tourist.phone}</p>
        <p>Status: ${tourist.status}</p>
        <button onclick="showTouristDetails('${tourist.id}')">View Details</button>
      </div>
    `);

    this.touristMarkers.set(tourist.id, marker);
  }

  addAlertMarker(alert) {
    const icon = L.divIcon({
      className: 'alert-marker',
      html: '<div class="alert-content">🚨</div>',
      iconSize: [40, 40]
    });

    const marker = L.marker([
      alert.location.latitude,
      alert.location.longitude
    ], { icon }).addTo(this.map);

    marker.bindPopup(`
      <div class="alert-popup">
        <h4>SOS Alert</h4>
        <p>Tourist: ${alert.touristName}</p>
        <p>Phone: ${alert.touristPhone}</p>
        <p>Emergency Contact: ${alert.emergencyContact}</p>
        <button onclick="acknowledgeAlert('${alert.alertId}')">Acknowledge</button>
        <button onclick="resolveAlert('${alert.alertId}')">Resolve</button>
      </div>
    `);

    this.alertMarkers.set(alert.alertId, marker);
  }

  updateAlertsList(alerts) {
    const alertsList = document.getElementById('alerts-list');
    alertsList.innerHTML = '';

    alerts.forEach(alert => {
      const alertElement = document.createElement('div');
      alertElement.className = `alert-item ${alert.status.toLowerCase()}`;
      alertElement.innerHTML = `
        <div class="alert-header">
          <span class="alert-type">🚨 ${alert.alertType}</span>
          <span class="alert-time">${new Date(alert.createdAt.seconds * 1000).toLocaleTimeString()}</span>
        </div>
        <div class="alert-details">
          <p><strong>${alert.touristName}</strong></p>
          <p>${alert.touristPhone}</p>
          <p>Status: ${alert.status}</p>
        </div>
        <div class="alert-actions">
          ${alert.status === 'ACTIVE' ? `<button onclick="acknowledgeAlert('${alert.alertId}')">Acknowledge</button>` : ''}
          ${alert.status === 'ACKNOWLEDGED' ? `<button onclick="resolveAlert('${alert.alertId}')">Resolve</button>` : ''}
        </div>
      `;
      
      alertElement.onclick = () => this.focusOnAlert(alert);
      alertsList.appendChild(alertElement);
    });
  }

  focusOnAlert(alert) {
    this.map.setView([alert.location.latitude, alert.location.longitude], 15);
    const marker = this.alertMarkers.get(alert.alertId);
    if (marker) {
      marker.openPopup();
    }
  }

  setupRealtimeListeners() {
    // Listen for new alerts
    db.collection('alerts')
      .where('status', 'in', ['ACTIVE', 'ACKNOWLEDGED'])
      .onSnapshot(snapshot => {
        snapshot.docChanges().forEach(change => {
          if (change.type === 'added') {
            // New alert - reload alerts list
            this.loadAlerts();
          }
        });
      });

    // Listen for tourist location updates
    db.collection('tourists')
      .onSnapshot(snapshot => {
        snapshot.docChanges().forEach(change => {
          if (change.type === 'modified') {
            const tourist = change.doc.data();
            this.updateTouristMarker(tourist);
          }
        });
      });
  }

  updateTouristMarker(tourist) {
    const existingMarker = this.touristMarkers.get(tourist.id);
    if (existingMarker) {
      this.map.removeLayer(existingMarker);
    }
    this.addTouristMarker(tourist);
  }
}

// Global functions for button actions
async function acknowledgeAlert(alertId) {
  await updateAlertStatus(alertId, 'ACKNOWLEDGED');
}

async function resolveAlert(alertId) {
  await updateAlertStatus(alertId, 'RESOLVED');
}

async function updateAlertStatus(alertId, status) {
  try {
    const response = await fetch(`/api/alerts/${alertId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('authToken')}`
      },
      body: JSON.stringify({ status })
    });

    if (response.ok) {
      location.reload(); // Simple refresh for MVP
    }
  } catch (error) {
    console.error('Error updating alert:', error);
  }
}

// Initialize dashboard
const dashboard = new DashboardApp();
```

### 5. Mobile App Integration Points

#### 5.1 Firebase SDK Integration
```javascript
// Mobile app Firebase configuration
const firebaseConfig = {
  apiKey: "your-api-key",
  authDomain: "smart-tourist-mvp.firebaseapp.com",
  projectId: "smart-tourist-mvp",
  storageBucket: "smart-tourist-mvp.appspot.com",
  messagingSenderId: "123456789",
  appId: "your-app-id"
};

// Initialize Firebase in mobile app
firebase.initializeApp(firebaseConfig);
```

#### 5.2 Key Mobile App Functions
```javascript
// Tourist registration from mobile app
async function registerTourist(name, phone, emergencyContact) {
  const createTourist = firebase.functions().httpsCallable('createTourist');
  
  try {
    const result = await createTourist({
      name,
      phone,
      emergencyContact
    });
    
    return result.data;
  } catch (error) {
    console.error('Registration failed:', error);
    throw error;
  }
}

// SOS trigger from mobile app
async function triggerSOS(touristId, location, vitals) {
  const triggerSOSFunction = firebase.functions().httpsCallable('triggerSOS');
  
  try {
    const result = await triggerSOSFunction({
      touristId,
      location,
      vitals
    });
    
    return result.data;
  } catch (error) {
    console.error('SOS trigger failed:', error);
    throw error;
  }
}

// Location update from mobile app
async function updateLocation(touristId, location) {
  try {
    await firebase.firestore()
      .collection('tourists')
      .doc(touristId)
      .update({
        currentLocation: {
          latitude: location.latitude,
          longitude: location.longitude,
          timestamp: firebase.firestore.FieldValue.serverTimestamp()
        },
        updatedAt: firebase.firestore.FieldValue.serverTimestamp()
      });
  } catch (error) {
    console.error('Location update failed:', error);
    throw error;
  }
}
```

### 6. Deployment Configuration

#### 6.1 Firebase Deployment
```json
// firebase.json
{
  "functions": {
    "source": "functions",
    "runtime": "nodejs18"
  },
  "firestore": {
    "rules": "firestore.rules"
  },
  "hosting": {
    "public": "dashboard/public",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"]
  }
}
```

#### 6.2 Firestore Security Rules (MVP)
```javascript
// firestore.rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Tourists can read/write their own data
    match /tourists/{touristId} {
      allow read, write: if request.auth != null && request.auth.uid == touristId;
    }
    
    // Authorities can read all tourist data
    match /tourists/{touristId} {
      allow read: if request.auth != null && 
                     request.auth.token.role == 'AUTHORITY';
    }
    
    // Anyone authenticated can create alerts (for SOS)
    match /alerts/{alertId} {
      allow read, create: if request.auth != null;
      allow update: if request.auth != null && 
                       request.auth.token.role == 'AUTHORITY';
    }
    
    // Telemetry data - tourist can write, authorities can read
    match /telemetry/{touristId}/readings/{readingId} {
      allow create: if request.auth != null && request.auth.uid == touristId;
      allow read: if request.auth != null;
    }
    
    // Geofences - read only for tourists, read/write for authorities
    match /geofences/{fenceId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
                      request.auth.token.role == 'AUTHORITY';
    }
    
    // Devices - tourist can pair their own device
    match /devices/{deviceId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 7. Environment Configuration

#### 7.1 Environment Variables
```javascript
// functions/.env
FIREBASE_PROJECT_ID=smart-tourist-mvp
FIREBASE_API_KEY=your-firebase-api-key
FCM_SERVER_KEY=your-fcm-server-key

# For production
NODE_ENV=production
LOG_LEVEL=info

# For development
NODE_ENV=development  
LOG_LEVEL=debug
```

#### 7.2 Configuration Management
```javascript
// functions/src/config/index.js
const config = {
  development: {
    firebase: {
      projectId: 'smart-tourist-dev'
    },
    notifications: {
      enabled: false // Disable in dev
    },
    logging: {
      level: 'debug'
    }
  },
  production: {
    firebase: {
      projectId: 'smart-tourist-prod'
    },
    notifications: {
      enabled: true
    },
    logging: {
      level: 'info'
    }
  }
};

module.exports = config[process.env.NODE_ENV || 'development'];
```

### 8. Testing Strategy (MVP)

#### 8.1 Unit Tests for Cloud Functions
```javascript
// functions/test/createTourist.test.js
const test = require('firebase-functions-test')();
const admin = require('firebase-admin');

describe('createTourist', () => {
  beforeAll(() => {
    admin.initializeApp();
  });

  afterAll(() => {
    test.cleanup();
  });

  it('should create a tourist with valid data', async () => {
    const data = {
      name: 'Test Tourist',
      phone: '+91987654321',
      emergencyContact: '+91123456789'
    };

    const context = {
      auth: { uid: 'test-uid' }
    };

    const result = await require('../src/api/createTourist').createTourist(data, context);

    expect(result.success).toBe(true);
    expect(result.touristId).toBeDefined();
    expect(result.qrCode).toBeDefined();
  });

  it('should fail without authentication', async () => {
    const data = {
      name: 'Test Tourist',
      phone: '+91987654321',
      emergencyContact: '+91123456789'
    };

    const context = {}; // No auth

    await expect(
      require('../src/api/createTourist').createTourist(data, context)
    ).rejects.toThrow();
  });
});
```

#### 8.2 Integration Tests
```javascript
// functions/test/integration.test.js
describe('End-to-end MVP Flow', () => {
  it('should complete tourist registration and SOS flow', async () => {
    // 1. Create tourist
    const tourist = await createTourist({
      name: 'Test User',
      phone: '+91987654321',
      emergencyContact: '+91123456789'
    });

    expect(tourist.success).toBe(true);

    // 2. Update location
    await updateLocation(tourist.touristId, {
      latitude: 26.2041,
      longitude: 94.2095
    });

    // 3. Trigger SOS
    const alert = await triggerSOS(tourist.touristId, {
      latitude: 26.2041,
      longitude: 94.2095
    }, {
      heartRate: 120
    });

    expect(alert.success).toBe(true);

    // 4. Verify alert was created
    const alertDoc = await admin.firestore()
      .collection('alerts')
      .doc(alert.alertId)
      .get();

    expect(alertDoc.exists).toBe(true);
    expect(alertDoc.data().status).toBe('ACTIVE');
  });
});
```

### 9. Performance Optimization (MVP)

#### 9.1 Database Indexing
```javascript
// firestore.indexes.json
{
  "indexes": [
    {
      "collectionGroup": "alerts",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "status", "order": "ASCENDING" },
        { "fieldPath": "createdAt", "order": "DESCENDING" }
      ]
    },
    {
      "collectionGroup": "tourists", 
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "status", "order": "ASCENDING" },
        { "fieldPath": "updatedAt", "order": "DESCENDING" }
      ]
    }
  ]
}
```

#### 9.2 Caching Strategy
```javascript
// functions/src/utils/cache.js
class SimpleCache {
  constructor(ttl = 300000) { // 5 minutes default
    this.cache = new Map();
    this.ttl = ttl;
  }

  set(key, value) {
    this.cache.set(key, {
      value,
      timestamp: Date.now()
    });
  }

  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;

    if (Date.now() - item.timestamp > this.ttl) {
      this.cache.delete(key);
      return null;
    }

    return item.value;
  }

  clear() {
    this.cache.clear();
  }
}

// Cache for frequently accessed geofences
const geofenceCache = new SimpleCache(600000); // 10 minutes

module.exports = { SimpleCache, geofenceCache };
```

### 10. Monitoring and Logging (MVP)

#### 10.1 Basic Logging
```javascript
// functions/src/utils/logger.js
const functions = require('firebase-functions');

class Logger {
  static info(message, data = {}) {
    console.log(`[INFO] ${message}`, data);
    functions.logger.info(message, data);
  }

  static error(message, error = {}) {
    console.error(`[ERROR] ${message}`, error);
    functions.logger.error(message, error);
  }

  static warn(message, data = {}) {
    console.warn(`[WARN] ${message}`, data);
    functions.logger.warn(message, data);
  }
}

module.exports = Logger;
```

#### 10.2 Health Check Endpoint
```javascript
// functions/src/api/healthCheck.js
const admin = require('firebase-admin');

exports.healthCheck = async (req, res) => {
  try {
    const health = {
      status: 'healthy',
      timestamp: new Date().toISOString(),
      services: {}
    };

    // Check Firestore connectivity
    try {
      await admin.firestore().collection('_health').doc('check').get();
      health.services.firestore = 'connected';
    } catch (error) {
      health.services.firestore = 'error';
      health.status = 'degraded';
    }

    // Check Authentication service
    try {
      await admin.auth().listUsers(1);
      health.services.auth = 'connected';
    } catch (error) {
      health.services.auth = 'error';
      health.status = 'degraded';
    }

    // Basic metrics
    const touristCount = await admin.firestore()
      .collection('tourists')
      .where('status', '==', 'ACTIVE')
      .get();

    const activeAlerts = await admin.firestore()
      .collection('alerts')
      .where('status', '==', 'ACTIVE')
      .get();

    health.metrics = {
      activeTourists: touristCount.size,
      activeAlerts: activeAlerts.size
    };

    res.status(health.status === 'healthy' ? 200 : 503).json(health);

  } catch (error) {
    res.status(500).json({
      status: 'unhealthy',
      error: error.message,
      timestamp: new Date().toISOString()
    });
  }
};
```

### 11. Deployment Instructions

#### 11.1 Initial Setup
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize project
firebase init

# Select:
# - Functions (Node.js)
# - Firestore
# - Hosting

# Install dependencies
cd functions
npm install

# Deploy to Firebase
firebase deploy
```

#### 11.2 Environment Setup Script
```bash
#!/bin/bash
# setup-mvp.sh

echo "Setting up Smart Tourist MVP Backend..."

# Create Firebase project (manual step)
echo "1. Create Firebase project at https://console.firebase.google.com"
echo "2. Enable Authentication (Phone provider)"
echo "3. Create Firestore database"
echo "4. Enable Cloud Functions"

# Install dependencies
echo "Installing dependencies..."
cd functions
npm install firebase-functions firebase-admin qrcode

# Deploy functions
echo "Deploying functions..."
firebase deploy --only functions

# Deploy Firestore rules
echo "Deploying Firestore rules..."
firebase deploy --only firestore:rules

# Deploy dashboard
echo "Deploying dashboard..."
firebase deploy --only hosting

echo "MVP Backend setup complete!"
echo "Dashboard URL: https://YOUR_PROJECT.web.app"
```

### 12. Success Metrics and KPIs (MVP)

#### 12.1 Technical Metrics
```javascript
// Monitoring key performance indicators
const mvpKPIs = {
  functionality: {
    touristRegistration: '100% success rate',
    devicePairing: '95% success rate within 30 seconds',
    sosAlertLatency: '< 5 seconds end-to-end',
    geofenceDetection: '95% accuracy'
  },
  performance: {
    apiResponseTime: '< 2 seconds 95th percentile',
    dashboardLoadTime: '< 3 seconds',
    realtimeUpdates: '< 1 second delay'
  },
  reliability: {
    uptime: '99% availability',
    dataConsistency: '100% alert delivery',
    errorRate: '< 1% function errors'
  }
};
```

#### 12.2 User Experience Metrics
```javascript
const userMetrics = {
  mobile: {
    appCrashRate: '< 0.1%',
    sosButtonResponse: '100% reliability',
    batteryImpact: '< 5% drain per hour'
  },
  dashboard: {
    alertAcknowledgment: '< 30 seconds average',
    mapLoadTime: '< 2 seconds',
    concurrentUsers: 'Support 50+ simultaneous users'
  }
};
```

---

## MVP Implementation Timeline

### Week 1-2: Core Infrastructure
- Firebase project setup
- Basic Cloud Functions (createTourist, triggerSOS)
- Firestore schema implementation
- Dashboard HTML/CSS structure

### Week 3-4: Mobile Integration
- Firebase SDK integration points
- Device pairing functions
- Location update mechanisms
- SOS trigger implementation

### Week 5-6: Dashboard Features
- Real-time alert display
- Tourist map visualization
- Alert management (acknowledge/resolve)
- Basic authentication

### Week 7-8: Testing & Deployment
- Unit and integration tests
- Performance optimization
- Security rule validation
- Production deployment

This MVP backend structure provides a solid foundation for the Smart Tourist Safety System while keeping complexity minimal and focusing on core functionality. The architecture can be easily extended for the full production system once the MVP proves successful.