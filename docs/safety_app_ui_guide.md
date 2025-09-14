## Frontend UI/UX Style Guide: Safety App

### 1. Design Philosophy
Our design is guided by principles of clarity, urgency, and trust. The interface should feel intuitive and reassuring in normal use, while providing clear, unmissable guidance during an emergency.

- **Clarity:** Information is presented in a clean, scannable format. Users can understand the status and available actions at a glance.
- **Trustworthiness:** A consistent and professional design builds user confidence in the app's reliability, which is critical for a safety application.
- **Accessibility:** The design ensures readability and ease of use for all users, with high-contrast text and clear touch targets.

---

### 2. Color Palette
The color palette is designed to be calm and clean, using a strong action color for primary interactions and emergencies.

**Primary & Accent Colors**
- **Primary Red (#D93F34):** Primary buttons, active toggles, icons, emergency text/icons
- **Red-light (#FEEBEA):** Background for icons, subtle highlights related to primary actions

**System & Status Colors**
- **Success (#34A853):** "Safe" status card background, success indicators & text
- **Warning (#FBBF24):** Warning banners and non-critical alerts (BG: #FFFBEB)
- **Info Blue (#3B82F6):** Informational highlights (e.g., for map elements)

**Neutral Colors**
- **Neutral-900 (#111827):** Main headings, primary text content
- **Neutral-700 (#374151):** Subheadings, body text, active nav text
- **Neutral-500 (#6B7280):** Helper text, placeholders, inactive icons & nav text
- **Neutral-300 (#D1D5DB):** Borders, dividers
- **Neutral-200 (#E5E7EB):** Secondary button backgrounds, input field borders
- **Neutral-100 (#F3F4F6):** Main page background
- **White (#FFFFFF):** Card backgrounds, text on dark/colored backgrounds

---

### 3. Typography
A clean, sans-serif font is used for its excellent legibility on mobile screens.
- **Recommended Font Family:** Manrope, Inter, or similar modern sans-serif

**Typographic Scale**
- **Display (32px, Bold 700):** Large screen titles ("Searching for your band")
- **Emergency Heading (24px, Bold 700):** "EMERGENCY MODE", "Geo-fence Alert"
- **Heading / Page Title (20px, Semi-Bold 600):** Top app bar titles ("Settings", "Onboarding")
- **Card Title (18px, Semi-Bold 600):** Titles within cards ("Live Vitals", "Language")
- **Body (16px, Regular 400):** Main text content, descriptions, list items
- **Sub-text / Helper (14px, Regular 400):** Descriptive text below titles/inputs
- **Label / Category (12px, Medium 500):** Small all-caps labels ("GENERAL", "SAFETY")
- **Button (16px, Semi-Bold 600):** Text inside all major buttons

---

### 4. Layout & Spacing
A consistent **8px-based spacing scale** is used to create a balanced and organized layout.
- **Base Unit:** 8px
- **Page Padding:** 24px horizontal padding for main screen content
- **Gaps:**
  - Between Sections: 32px (e.g., between "Live Vitals" and "Location")
  - Between Cards: 16px (e.g., between settings items)
  - Within Cards: 16px – 24px padding

---

### 5. Components

**Buttons**
- **Corner Radius:** 12px
- **Padding:** 16px 24px
- **Sizing:** Typically full-width of padded content area
- **Types:**
  - Primary (Red): BG Primary Red, Text White
  - Secondary (Light): BG Neutral-200, Text Neutral-700
  - Chip / Segmented: Selected → BG Primary Red, Text White; Default → BG White, Text Neutral-700, Border Neutral-300

**Cards & Containers**
- Corner Radius: 16px
- Background: White
- Box Shadow: 0px 4px 12px rgba(0,0,0,0.05)
- Borders: None (dashed Neutral-300 for upload areas)

**Input Fields**
- Corner Radius: 12px
- Padding: 16px
- Background: White
- Borders:
  - Default: Neutral-300, Text Neutral-900
  - Focus: Border Primary Red, Shadow rgba(217, 63, 52, 0.2)
  - Success: Green checkmark icon inside field

**Navigation Bar (Bottom)**
- Height: ~80px with padding
- Icon Size: 24px
- Label Font Size: 12px
- Inactive State: Icon/Text Neutral-500
- Active State: Icon/Text Primary Red

**Modals & Pop-ups**
- Corner Radius: 24px (top corners)
- Layout: Slide up from bottom
- Content: Prominent icon, heading, descriptive text, buttons

---

### 6. Iconography
- **Style:** Clean, minimalist outlines
- **Library:** Phosphor Icons or Lucide Icons
- **Default Size:** 24px × 24px
- **Stroke Width:** 1.5px
- **Colors:**
  - Default/Inactive: Neutral-500
  - Active/Emphasized: Primary Red
  - In-card: Often shown with circular Red-light background

