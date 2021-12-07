import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart'as http;
class WeatherRepo{
  Future<WeatherModel> getDataFromApi()async{
    var url= Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=london&appid=6b446c749b4846036320479dd64d4d8a");
    http.Response response= await http.get(url);
    if(response.statusCode == 200){
      var weather= WeatherModel.fromJson(jsonDecode(response.body));
      print("ssss");
      print(response.statusCode);
      return weather;
    }else{
      throw Exception("Data not found");
    }
  }

  List<String> cityList=[
    "Dhaka",
    "khulna",
    "London",
    "Mumbai",
    "chenni"
  ];
}