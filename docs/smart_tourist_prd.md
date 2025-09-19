# Software-Specific Product Requirements Document (PRD)

## Project: Smart Tourist Safety Monitoring & Incident Response System

### Context & Problem Statement
Tourists in Northeast India face unique safety challenges due to remote terrains, poor network coverage, and limited real-time monitoring by authorities. The hardware IoT band provides continuous telemetry, but without a robust software ecosystem (apps, backend, AI models, blockchain, dashboards), its value is incomplete. This document defines the software requirements that complement the IoT hardware, ensuring an **end-to-end safety and incident response solution**.

---

## Goals
- Provide tourists with a **mobile app** for alerts, panic triggers, and safety awareness.
- Enable **real-time monitoring** and **incident response** through dashboards for police and tourism departments.
- Ensure **secure, tamper-proof digital ID management** via blockchain.
- Detect anomalies in tourist behaviour using **AI/ML models**.
- Guarantee **data security, privacy, and compliance** with Indian and international laws.

---

## Key Software Components

### 1. Tourist Mobile Application (Android-first)
- **Core Features:**
  - BLE sync with IoT band (GPS, HR, SpO₂, motion, tamper data).
  - Panic button in-app (redundant to hardware SOS).
  - Geo-fencing alerts when entering restricted/high-risk areas.
  - Tourist Safety Score (real-time risk assessment).
  - Live tracking (opt-in) for families and police.
  - Multilingual UI (10+ Indian languages + English).
  - Offline mode with **store-and-forward sync**.
- **Tech Stack:** Flutter (cross-platform) or Kotlin (Android-native) for MVP.
- **Integrations:** BLE SDK, Mapbox/Google Maps, Firebase Cloud Messaging.

### 2. Backend Services
- **MVP:** Firebase/Supabase (fast prototyping, real-time database, push notifications).
- **Full Deployment:** NIC MeghRaj cloud for govt compliance.
- **Microservices Modules:**
  - Tourist profile & ID service (links with blockchain).
  - IoT data ingestion service (LoRaWAN → MQTT → API gateway).
  - Alert & notification service (push to families, police units).
  - Geo-fencing engine (real-time boundary monitoring).
  - Analytics & reporting service.

### 3. Blockchain Layer (Hyperledger Fabric)
- **Consortium blockchain** with stakeholders: Ministry of Tourism, Police, NIC.
- **Stored On-Chain:**
  - Tourist digital ID.
  - Trip metadata (validity period, itinerary).
  - Event hashes (panic, fall, tamper) for immutability.
- **Stored Off-Chain:** Sensor data, GPS traces, health logs.
- **Integration:** Backend microservices invoke Fabric smart contracts (via SDK).

### 4. AI/ML Engine
- **Anomaly Detection Models:**
  - Sudden location drop-off.
  - Prolonged inactivity.
  - Route deviation (from itinerary).
  - Silent distress (no signals for prolonged time).
- **Tourist Safety Score:**
  - Inputs: location risk (historical crime/accident data), time of day, recent alerts, health anomalies.
  - Model: Gradient boosting / Random forest (tabular features) for interpretability.
- **Geo-Fencing:** Real-time geospatial algorithms on streaming data.
- **Infrastructure:** Kafka (event streaming), Spark/Flink (stream processing), TensorFlow/PyTorch (model training).
- **Deployment:** MLflow for model versioning, containerized inference on MeghRaj.

### 5. Police & Tourism Dashboard
- **Core Features:**
  - Real-time map with tourist clusters.
  - Heatmaps of risk zones and active alerts.
  - Searchable tourist registry (blockchain-linked IDs).
  - Automated E-FIR generation for missing cases.
  - Alert history + last known location.
- **Tech Stack:** React.js frontend, Node.js/Express backend.
- **Visualization:** Mapbox/D3.js for geospatial analytics.
- **Authentication:** Govt SSO or NIC eGov standards.

### 6. Data Privacy & Security
- **Encryption:** TLS 1.3 in transit, AES-256 at rest.
- **Identity Verification:** Blockchain ensures tamper-proof IDs.
- **Hybrid Storage:**
  - On-chain → IDs, event metadata.
  - Off-chain → detailed telemetry.
- **Compliance:** DPDP Act (India), GDPR (for foreign tourists).

---

## System Architecture (High-Level Flow)
1. Tourist registers → Digital ID created on blockchain.
2. IoT band streams data via LoRa → gateway → backend OR BLE → app → backend.
3. Backend processes streams → anomaly detection engine → alerts.
4. Blockchain logs immutable event IDs.
5. Dashboards show live tourist status, alerts, clusters.
6. Notifications sent to police, family, and emergency contacts.

---

## Development Phases

### Phase 1 (MVP – 2–3 Months)
- Android app: panic button, BLE sync, geo-fence alerts.
- Basic backend with Firebase/Supabase.
- Basic dashboard with real-time map & alerts.
- Blockchain ID issuance prototype.

### Phase 2 (Pilot – 3–6 Months)
- AI anomaly detection integration.
- Police dashboard with E-FIR.
- LoRa ingestion pipeline.
- Move backend to MeghRaj.

### Phase 3 (Scale-up – 6–12 Months)
- Support 10k+ concurrent users.
- Advanced dashboards with predictive analytics.
- ML-based safety scoring.
- Multi-state deployment.

### Phase 4 (Nationwide – 12–24 Months)
- Integration with national tourism + police networks.
- Cross-border tourist compliance.
- Third-party APIs for travel agencies.

---

## Risks & Mitigation
- **Network issues:** Offline sync, LoRa gateways in critical hubs.
- **Tourists without smartphones:** Band-only mode (QR code + LoRa telemetry).
- **Scalability:** Use microservices + container orchestration (Kubernetes).
- **Govt adoption:** Early engagement with NIC & police.

---

## Success Criteria
- Panic alerts delivered in <5 seconds.
- 90%+ accuracy in anomaly detection.
- Blockchain ID issuance latency <10 seconds.
- Dashboard uptime 99.5%.

---

## Strategic Value
The software ecosystem forms the **nerve center** of the Smart Tourist Safety System. It connects the IoT hardware, blockchain-based identity, AI-driven insights, and authority dashboards into a single secure ecosystem. This makes tourism safer, builds trust, and positions the Northeast region as a **smart, safe, and future-ready travel hub**.

