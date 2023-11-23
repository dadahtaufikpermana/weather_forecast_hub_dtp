
README.md for Weather Forecast Hub DTP - GitHub Project

Weather Forecast Hub DTP
Welcome to the Weather Forecast Hub DTP repository! This Flutter application provides accurate weather forecasts based on user locations. Below are instructions to guide you through running and testing the application.

Prerequisites
Make sure you have the following installed on your development machine:

Flutter SDK
Dart SDK
Firebase Account (for authentication)
API Key from OpenWeatherMap
Getting Started
1. Clone the repository:
git clone https://github.com/your-username/weather-forecast-hub-dtp.git

2.Navigate to the project directory:
cd weather-forecast-hub-dtp

3.Install dependencies:
flutter pub get

4.Create a Firebase project and configure your app by following the steps in the Firebase documentation.

Add your Firebase configuration files:

For Android: Place google-services.json in the android/app directory.
Obtain an API key from OpenWeatherMap and replace YOUR_OPENWEATHERMAP_API_KEY in lib/data/api/app_url/api_key.dart with your key.

Running the App
Use the following command to run the application on an emulator or connected device:
flutter run

Testing Authentication
You can test authentication by creating a user account or using Gmail/phone number for login. Ensure that Firebase authentication methods are correctly set up in your Firebase console.

Issues and Contributions
Feel free to submit issues or contribute to the project! Your feedback and contributions are highly appreciated.




