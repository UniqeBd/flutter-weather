import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  // WeatherAPI.com API key
  static const String _apiKey = "99574b0a746a4da28e343831250608";
  static const String _baseUrl = "http://api.weatherapi.com/v1";

  Future<WeatherModel> getDataFromApi(String city) async {
    var url = Uri.parse("$_baseUrl/current.json?key=$_apiKey&q=$city&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var weather = WeatherModel.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      throw Exception("Data not found");
    }
  }

  // get data by lat long
  Future<WeatherModel> getDataFromApiByLatlong(lat, long) async {
    var url =
        Uri.parse("$_baseUrl/current.json?key=$_apiKey&q=$lat,$long&aqi=no");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var weather = WeatherModel.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      throw Exception("Data not found");
    }
  }

  List<String> cityList = [
    "Dhaka",
    "khulna",
    "London",
    "Mumbai",
    "chenni",
    "Chittagong",
    "Rajshahi",
    "Paris",
    "Tokyo",
    "Singapore",
    "Los Angeles",
    "Moscow"
  ];
}
