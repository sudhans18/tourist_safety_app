# MVP App Flow – Mobile App (Tourist-facing)

## 1. Onboarding & Registration
- **Splash Screen** → App logo, quick load.
- **Language Selection** → Choose English / Hindi (MVP languages).
- **Registration Screen** → Input phone number, OTP verification (mock Firebase Auth for MVP).
- **Tourist ID Confirmation** → Auto-generate a temporary digital ID; show to user.

## 2. Home Dashboard
- **Top Bar**: Tourist ID, quick SOS button.
- **Map View**: Current GPS location (synced from phone/band).
- **Band Connection Status**: BLE pairing indicator.
- **Vital Stats (MVP)**: Heart rate (live), location, SOS button state.

## 3. Band Integration Flow
- **Pairing Screen** → Scan for nearby BLE devices (smart band).
- **Connect** → Show connected device details.
- **Streaming Data** → Background sync of GPS, heart rate, accelerometer.

## 4. Geo-fencing & Alerts
- **Risk Zone Detection** (background service):
  - If user enters restricted area → Trigger in-app alert (popup + haptic feedback from band).
- **Notification Handling** → Push notification + vibration.

## 5. Panic/SOS Flow
- **App SOS Button** → Triggers API call → sends Tourist ID + GPS + vitals to backend.
- **Band SOS Button** → App receives via BLE → forwards to backend.
- **Confirmation Screen** → “SOS Sent – Help on the way”.

---

# Key Background Processes
- **Mobile App**:
  - BLE sync loop → App → Firebase.
  - Geo-fence detection → Firebase.
  - SOS forwarding → Firebase.

---

