# MVP PRD – Mobile App (Tourist-facing)

## Context
The mobile app is the **primary interface for tourists** to interact with the Smart Tourist Safety System. For MVP, the goal is to deliver **essential safety and monitoring functions** that integrate with the IoT smart band, backend, and emergency response workflows.

## Objectives
- Provide tourists with a secure **digital ID** (synced with blockchain backend).
- Enable **real-time location monitoring** with geo-fencing alerts.
- Offer a **panic/SOS button** for emergencies.
- Support **multilingual interface** (English + 1–2 Indian languages for MVP).

## Scope (MVP)
1. **User Onboarding & ID**
   - Tourist registers with phone number / KYC ID (mock integration for MVP).
   - Digital Tourist ID generated and stored locally + synced to backend.

2. **Band Integration**
   - Connect app with IoT smart band over **BLE**.
   - Sync **GPS, heart rate, accelerometer (fall detection), SOS button state**.
   - Store readings locally, forward to backend via WiFi/4G.

3. **Geo-fencing & Alerts**
   - Load risk-zone polygons from backend.
   - Detect entry into restricted/high-risk zones.
   - Trigger in-app warning + push notification.

4. **Panic/SOS Function**
   - Dedicated button in app.
   - Sends tourist ID + live location + band vitals to backend.

5. **Language Support**
   - English + Hindi (extendable later).
   - Basic multilingual text labels and buttons.

## Out of Scope (for MVP)
- Advanced anomaly detection.
- Route planning & itinerary tracking.
- Family tracking/sharing.
- Offline-first storage beyond minimal retries.
- Voice/chatbot emergency access.

## Tech Stack
- **Frontend**: Flutter (recommended) or React Native for cross-platform.
- **BLE Integration**: FlutterBlue / react-native-ble-plx.
- **Maps & Geo-fencing**: Google Maps SDK / Mapbox.
- **Backend (for MVP)**: Firebase (Auth, Firestore, Cloud Functions).
- **Notifications**: Firebase Cloud Messaging.

## Success Criteria
- Tourist can register and obtain a digital ID.
- Band connects and streams GPS + heart rate to app.
- SOS button works and triggers an alert in backend.
- Geo-fence alerts trigger when entering restricted zone.

---

