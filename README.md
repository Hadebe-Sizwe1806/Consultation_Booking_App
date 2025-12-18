# 🚀 Consultation Booking App  
### Flutter • Firebase • Provider

A **cross-platform Flutter application** developed to manage student consultations and profiles.  
This project demonstrates **modern Flutter development**, **secure Firebase integration**, and **clean architectural practices**, making it suitable for both **academic assessment** and **professional portfolios**.

---

## 📌 Project Overview

The Student Consultation Management App enables students to securely authenticate, manage their profiles, and book consultations through a clean and intuitive interface.  
The application integrates Firebase for authentication and data storage while following **industry-standard security practices** to protect sensitive configuration.

---

## ✨ Key Features

- 🔐 Secure user authentication (Firebase Authentication)
- 👤 Student profile creation and management
- 📅 Consultation booking and viewing
- 🔄 Real-time data handling with Cloud Firestore
- 📱 Cross-platform support (Android, Web, Desktop)
- 🧼 Clean MVVM-style architecture
- 🔒 No sensitive credentials committed to GitHub

---

## 🛠️ Technology Stack

| Layer | Technologies |
|------|-------------|
| Frontend | Flutter, Dart |
| State Management | Provider |
| Backend | Firebase Authentication, Cloud Firestore |
| Tooling | FlutterFire CLI, Git |
| Platforms | Android, Web, Desktop |

---

## 🧱 Project Structure
lib/
├── routes/ # Centralized routing
├── viewmodels/ # Business logic (Provider)
├── views/
│ └── screens/ # UI screens
├── firebase_options.dart # Local Firebase config (ignored)
├── firebase_options_example.dart # Public example config
└── main.dart # Application entry point


---

## 🔐 Firebase Configuration (Secure Setup)

This repository **does not include real Firebase credentials**.  
Sensitive configuration is excluded using `.gitignore`.

### ▶️ Local Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Hadebe-Sizwe1806/Consultation_Booking_App.git
   cd Consultation_Booking_App
2. ** Install dependencies **
      ```bash
    flutter pub get
3. **Create a Firebase project**
   Go to the Firebase Console
   Enable Authentication and Cloud Firestore
4. **Configure Firebase for Flutter**
   flutterfire configure
5. **Create local Firebase config**
      ```bash
cp lib/firebase_options_example.dart lib/firebase_options.dart
6. **Run the application**
  ```bash
     flutter run




