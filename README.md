# Weather App

A beautiful Flutter weather application that provides real-time weather information with animated weather conditions and location-based services.

## Author
**Md Shoaib Hossain Alshan**

## Features

- 🌤️ Real-time weather data from OpenWeatherMap API
- 📍 GPS location-based weather detection
- 🎨 Animated weather condition GIFs
- 🏙️ Predefined city selection
- 📱 Responsive design for mobile devices
- 🌡️ Temperature display in Celsius
- 💨 Wind speed, humidity, and pressure information
- 🌅 Sunrise and sunset times

## Screenshots

The app displays weather information with beautiful animated GIFs for different weather conditions including rain, clear skies, clouds, and more.

## Prerequisites

Before running this application, make sure you have:

- Flutter SDK installed (>=2.12.0 <3.0.0)
- Android Studio or Xcode for device/emulator
- An active internet connection
- OpenWeatherMap API key

## Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/jannatsuha/weather.git
   cd weather
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **API Key Configuration**
   - Sign up at [OpenWeatherMap](https://openweathermap.org/api) to get a free API key
   - Replace the API key in `lib/repo/weather_repo.dart`:
     ```dart
     // Replace YOUR_API_KEY_HERE with your actual API key
     var url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=YOUR_API_KEY_HERE");
     ```

4. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── model/
│   └── weather_model.dart    # Weather data models
├── provider/
│   └── weather_provider.dart # State management
├── repo/
│   └── weather_repo.dart     # API service layer
├── screens/
│   ├── current_location.dart # City selection screen
│   └── home_page.dart        # Weather details screen
└── utills/
    ├── all_colors.dart       # Color constants
    ├── all_size.dart         # Size constants
    └── all_strings.dart      # String constants
```

## Dependencies

- `flutter` - UI framework
- `http: ^0.13.0` - HTTP requests
- `provider: ^6.0.1` - State management
- `geolocator: ^8.0.0` - Location services
- `flutter_native_splash: ^1.2.3` - Splash screen

## Usage

1. **Launch the app** - The app opens with a city selection screen
2. **Select location** - Choose from predefined cities or use dropdown menu
3. **View weather** - Tap "Get Weather" to see detailed weather information
4. **Location permission** - Grant location permission for GPS-based weather

## Supported Cities

The app includes weather data for major cities including:
- Dhaka, Khulna, Sylhet, Barishal (Bangladesh)
- London, Paris, Moscow (Europe)
- Mumbai, Chennai (India)
- Tokyo, Singapore (Asia)
- Los Angeles (North America)

## API Reference

This app uses the [OpenWeatherMap API](https://openweathermap.org/api) for weather data:
- Current weather by city name
- Current weather by geographic coordinates
- Weather conditions, temperature, humidity, wind speed

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you found this project helpful, please give it a ⭐ on GitHub!

For any questions or support, please open an issue in the repository.
