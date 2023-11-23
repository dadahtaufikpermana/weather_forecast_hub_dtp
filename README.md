# Weather Forecast Hub DTP

Welcome to the Weather Forecast Hub DTP repository! This Flutter application provides accurate weather forecasts based on user locations. Below are instructions to guide you through running and testing the application.

## Prerequisites

Make sure you have the following installed on your development machine:

- Flutter SDK
- Dart SDK
- Firebase Account (for authentication)
- API Key from [OpenWeatherMap](https://openweathermap.org/)

## Dependencies

This project relies on the following dependencies:

- [Provider](https://pub.dev/packages/provider): A library for state management.
- [Flash](https://pub.dev/packages/flash): A library for displaying custom flash messages.
- [SharedPreferences](https://pub.dev/packages/shared_preferences): A library for reading and writing simple key-value pairs.
- [Hexcolor](https://pub.dev/packages/hexcolor): A library for converting color hex strings to Flutter Color objects.
- [Intl](https://pub.dev/packages/intl): A library for internationalization and localization.
- [Http](https://pub.dev/packages/http): A library for making HTTP requests.
- [Geolocator](https://pub.dev/packages/geolocator): A library for getting device location.
- [Geocoding](https://pub.dev/packages/geocoding): A library for converting between geographic coordinates and addresses.
- [Firebase Auth](https://pub.dev/packages/firebase_auth): A library for Firebase authentication.
- [Firebase Core](https://pub.dev/packages/firebase_core): A library for Firebase initialization.
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore): A library for Cloud Firestore integration.
- [Build Runner](https://pub.dev/packages/build_runner): A library for running code generation tasks.
- [Google Sign In](https://pub.dev/packages/google_sign_in): A library for Google Sign In integration.
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons): A library for setting custom app icons.
- [Inspection](https://pub.dev/packages/inspection): A custom library for inspection (include its Git link).

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/weather-forecast-hub-dtp.git

2. **Navigate to the project directory:**

   ```bash
   cd weather-forecast-hub-dtp


3. **Create a Firebase project and configure your app by following the steps in the Firebase [Firebase Documentation](https://firebase.google.com/docs/flutter/setup?hl=id&platform=android).**


4. **Add your Firebase configuration files: For Android: Place google-services.json in the android/app directory.**

5. **Obtain an API key from [OpenWeatherMap](https://openweathermap.org/) and replace YOUR_OPENWEATHERMAP_API_KEY in lib/data/api/app_url/api_key.dart with your key.**

6. **Running the App:**
Use the following command to run the application on an emulator or connected device:

   ```bash
   flutter run

## Testing Authentication
You can test authentication by creating a user account or using Gmail, email and password and phone number for login. Ensure that Firebase authentication methods are correctly set up in your Firebase console.

