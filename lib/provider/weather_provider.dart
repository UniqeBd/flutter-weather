import 'package:flutter/foundation.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repo/weather_repo.dart';

class WeatherProvider with ChangeNotifier{
  WeatherRepo weatherRepo= WeatherRepo();
  WeatherModel _weatherModel = WeatherModel.demo();
  WeatherModel get weatherModel => _weatherModel;
  bool isLoading= true;
  getWeatherData(String cityName)async{
    _weatherModel= await weatherRepo
        .getDataFromApi(cityName);
    notifyListeners();
    isLoading= false;
    notifyListeners();
  }

  //from lat long
  getWeatherDataByLatLong(lat, long)async{
    _weatherModel= await weatherRepo
        .getDataFromApiByLatlong(lat, long);

    notifyListeners();
    isLoading= false;
    notifyListeners();
  }
  // on back button press
  backButtonPress()async{
    _weatherModel= await weatherRepo
        .getDataFromApi("Tungipara");
    notifyListeners();
  }
// dropdown
  List<String> cityList=[];
  getCityList(){
    cityList=weatherRepo.cityList;
    notifyListeners();
  }

  changeValue(oldVal){
    oldVal;
    notifyListeners();
  }
}