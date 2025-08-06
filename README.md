# 🌤️ Flutter Weather App

A beautiful and functional weather application built with Flutter that provides real-time weather information with location-based services and multi-city support.

## Author  
**Md Shoaib Hossain Alshan**   

## 📱 Features

### Core Functionality
- 🌍 **Real-time Weather Data** - Get current weather conditions for any city
- 📍 **GPS Location Support** - Automatic weather detection based on your current location
- 🏙️ **Multi-City Weather** - Quick access to weather in major cities (Dhaka, Khulna, Sylhet, Barishal, Chittagong, Rajshahi)
- 🎨 **Animated Weather Icons** - Dynamic GIF animations based on weather conditions
- 💨 **Detailed Weather Info** - Temperature, humidity, wind speed, pressure, and weather description
- 📱 **Cross-Platform** - Works on both Android and iOS devices
- 🌐 **Web Support** - Also runs in Chrome browsers

### Weather Conditions Supported
- ☀️ Clear/Sunny weather
- ☁️ Cloudy conditions  
- 🌧️ Rain and showers
- 🌫️ Haze and fog
- ❄️ Cold weather
- 🌩️ Thunderstorms

## 🛠️ Technical Stack

- **Framework**: Flutter 3.32.4
- **Language**: Dart
- **State Management**: Provider Pattern
- **HTTP Requests**: HTTP package
- **Location Services**: Geolocator package
- **Weather API**: WeatherAPI.com
- **Architecture**: Clean Architecture with Repository Pattern

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point
├── model/
│   └── weather_model.dart       # Weather data models
├── provider/
│   └── weather_provider.dart    # State management
├── repo/
│   └── weather_repo.dart        # API service layer
├── screens/
│   ├── current_location.dart    # Home screen with city selection
│   └── home_page.dart          # Weather details screen
└── utils/
    ├── all_colors.dart         # Color constants
    ├── all_size.dart           # Size constants
    └── all_strings.dart        # String constants

assets/
├── gif/                        # Weather animation assets
│   ├── day-rain.gif
│   ├── day-cloud.gif
│   ├── hot.gif
│   └── ...
└── image/
    ├── splash.png
    └── btn.jpg
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=2.12.0)
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/UniqeBd/flutter-weather.git
   cd flutter-weather
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **API Key Configuration**
   - The app uses WeatherAPI.com (Go to this site and create an account then apply your API Key)
   - Weather data is fetched from `api.weatherapi.com`

4. **Run the application**
   ```bash
   # For Android emulator
   flutter run
   
   # For Chrome (web)
   flutter run -d chrome
   
   # For specific device
   flutter devices
   flutter run -d <device_id>
   ```

## 📂 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.0              # HTTP requests
  provider: ^6.0.1           # State management
  geolocator: ^9.0.2         # Location services
  cupertino_icons: ^1.0.2    # iOS style icons

dev_dependencies:
  flutter_native_splash: ^1.2.3  # Splash screen
```

## 🔧 Configuration Details

### Android Configuration
- **Target SDK**: 34
- **Compile SDK**: 35 (required for geolocator)
- **NDK Version**: 25.1.8937393
- **Gradle Version**: 8.1.2
- **Permissions**: 
  - Internet access
  - Fine location access
  - Coarse location access
  - Background location access

### Location Permissions
The app requests location permissions to provide weather data for your current location:
- `ACCESS_FINE_LOCATION`
- `ACCESS_COARSE_LOCATION` 
- `ACCESS_BACKGROUND_LOCATION`

## 📱 Screenshots & Usage

### Home Screen
- Displays city selection dropdown
- Shows grid of popular cities (Dhaka, Khulna, Sylhet, etc.)
- "Get Weather" button for current location
- Beautiful background with weather-themed imagery

### Weather Details Screen
- Current temperature in Celsius
- Weather condition description
- Detailed weather metrics:
  - Humidity percentage
  - Wind speed (m/s)
  - Atmospheric pressure
  - Weather description
- Animated weather icons based on conditions

## 🌐 API Integration

The app integrates with WeatherAPI.com for real-time weather data:
- **Base URL**: `http://api.weatherapi.com/v1/current.json`
- **Features**: Current weather, location search, coordinate-based lookup
- **Data Format**: JSON response with comprehensive weather information

## 🔄 State Management

Uses Provider pattern for efficient state management:
- `WeatherProvider` handles all weather-related state
- Repository pattern for API calls
- Reactive UI updates when weather data changes

## 🎨 UI/UX Features

- **Responsive Design**: Adapts to different screen sizes
- **Animated Assets**: Weather condition GIFs for visual appeal
- **Material Design**: Clean, modern interface following Material Design principles
- **Loading States**: Proper loading indicators during API calls
- **Error Handling**: User-friendly error messages for network issues

## 🚀 Build & Deployment

### Android APK Build
```bash
flutter build apk --release
```

### Web Build
```bash
flutter build web
```

### Development vs Production
- Development: Debug mode with hot reload
- Production: Release builds with optimizations

## 🛠️ Troubleshooting

### Common Issues
1. **Network Connectivity**: Ensure internet connection for API calls
2. **Location Permissions**: Grant location access for GPS features
3. **Android Build Issues**: Ensure NDK and SDK versions are compatible
4. **API Limits**: Free tier has request limitations

### Android Emulator Issues
- Use cold boot for network connectivity issues
- Ensure emulator has Google Play Services
- Check DNS settings if API calls fail

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Developer

**UniqeBd**
- GitHub: [@UniqeBd](https://github.com/UniqeBd)
- Email: shoaibhossain2302@gmail.com

## 🙏 Acknowledgments

- [WeatherAPI.com](https://www.weatherapi.com/) for weather data
- [Flutter](https://flutter.dev/) for the amazing framework
- [Geolocator](https://pub.dev/packages/geolocator) for location services
- Weather icons and animations from various sources

## 📝 Version History

- **v1.0.0** - Initial release with core weather functionality
  - Real-time weather data
  - Location-based weather
  - Multi-city support
  - Cross-platform compatibility (Android, iOS, Web)

---

**⭐ Star this repository if you found it helpful!**



