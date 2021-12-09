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
    isLoading= false;
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