# NXL Flutter Assignment

A Flutter application demonstrating a complete Authentication Flow using **Riverpod** for state management. This project includes user registration, login, and robust form validation.

## 🚀 Features

* **User Registration:** Create a new account. Data is persisted to allow immediate testing of the authentication flow.
* **Secure Login:** Authenticate using the credentials created during registration.
* **Field Validation:** * Real-time email format validation (e.g., example@mail.com).
    * Password strength and length requirements.
    * Comprehensive empty field detection for all inputs to ensure data integrity.
* **State Management:** Built with **Riverpod** for a clean, reactive, and scalable architecture.

---

## 🛠️ Getting Started

### Prerequisites
* Flutter SDK installed on your machine.
* A mobile emulator (Android/iOS) or a physical device.

### Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/amarjithp/nxlassignment.git](https://github.com/amarjithp/nxlassignment.git)
   cd nxlassignment```
2. **Install dependencies:**
   Run the following command to fetch all required packages, including Riverpod:
   ```bash
   flutter pub get```

3. **Run the application:**
   Launch the app on your connected device:
   ```bash
   flutter run```

---

## 🧪 Testing the Flow

1. **Register:** Launch the app and navigate to the **Registration** screen.
2. **Validate:** Try submitting empty fields or invalid emails to see the **Field Validation** in action.
3. **Create Account:** Complete the registration with valid details.
4. **Login:** Return to the **Login** screen and use your **newly created credentials**. The app will authenticate you based on the stored user data.

---
