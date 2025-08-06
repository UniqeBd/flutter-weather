import 'package:flutter/foundation.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repo/weather_repo.dart';

class WeatherProvider with ChangeNotifier {
  WeatherRepo weatherRepo = WeatherRepo();
  WeatherModel _weatherModel = WeatherModel.demo();
  WeatherModel get weatherModel => _weatherModel;
  bool isLoading = true;
  String? errorMessage;

  getWeatherData(String cityName) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      _weatherModel = await weatherRepo.getDataFromApi(cityName);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = "Failed to load weather data: ${e.toString()}";
      notifyListeners();
      print("Weather API Error: $e");
    }
  }

  //from lat long
  getWeatherDataByLatLong(lat, long) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      _weatherModel = await weatherRepo.getDataFromApiByLatlong(lat, long);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = "Failed to load weather data: ${e.toString()}";
      notifyListeners();
      print("Weather API Error: $e");
    }
  }

  // on back button press
  backButtonPress() async {
    _weatherModel = await weatherRepo.getDataFromApi("Tungipara");
    notifyListeners();
  }

// dropdown
  List<String> cityList = [];
  getCityList() {
    cityList = weatherRepo.cityList;
    notifyListeners();
  }

  changeValue(oldVal) {
    oldVal;
    notifyListeners();
  }
}
