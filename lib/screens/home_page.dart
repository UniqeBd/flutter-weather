import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utills/all_colors.dart';
import 'package:weather_app/utills/all_size.dart';
class MyHomePage extends StatefulWidget {
  String dVal;
   MyHomePage({Key? key,required this.dVal})
       : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context,listen: false)
        .getWeatherData(widget.dVal);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        backgroundColor: Colors.transparent,
      ),
      body:
      Consumer<WeatherProvider>(
        builder: (context, weatherPro, child) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          String weather = weatherPro.weatherModel
              .weather[0].main;
          return WillPopScope(
            onWillPop: ()async{
              weatherPro.backButtonPress();
              return true;
            },
            child: Container(
              color: Colors.white,
              child:
                  weatherPro.weatherModel.weather[0].main.isEmpty
                  ? const CircularProgressIndicator()
                  :Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: height / 2.8,
                        width: width / 1.8,
                        child: Image.asset(weather == 'Rain'
                            ? "assets/gif/day-rain.gif"
                            : weather == 'Haze'
                            ? 'assets/gif/day-cold.gif'
                            : weather == 'Clear'
                            ? 'assets/gif/hot.gif'
                            : weather == 'Clouds'
                            ? 'assets/gif/day-cloud.gif'
                            : "assets/gif/day-cloud.gif"),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              weatherPro.weatherModel.name,
                              style: TextStyle(
                                  fontSize: 30, color: AllColor.appBarColor),
                            ),
                          ),
                          Text(
                            (weatherPro.weatherModel.main.temp - 273)
                                .toStringAsFixed(2) +
                                ' \u00B0' +
                                'C',
                            style: TextStyle(
                                fontSize: 34, color: AllColor.appBarColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              weather,
                              style: TextStyle(
                                  fontSize: 30, color: AllColor.appBarColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          ListTile(
                            shape: Border(bottom: BorderSide(width: 0.5, color: AllColor.appBarColor)),
                            leading: Icon(Icons.where_to_vote),
                            title: Text('Temperature',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                            trailing: Text(
                              (weatherPro.weatherModel.main.temp - 273)
                                  .toStringAsFixed(2) +
                                  ' \u00B0' +
                                  'C',
                              style: TextStyle(
                                  color: AllColor.fontColor, fontSize: 20),
                            ),
                          ),
                          ListTile(
                            shape: Border(bottom: BorderSide(width: 0.5, color: AllColor.appBarColor)),
                            leading: Icon(Icons.where_to_vote),
                            title: Text('Weather',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                            trailing: Text(
                                weatherPro.weatherModel.weather[0].description,
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                          ),
                          ListTile(
                            shape: Border(bottom: BorderSide(width: 0.5, color: AllColor.appBarColor)),
                            leading: Icon(Icons.where_to_vote),
                            title: Text('Humidity',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                            trailing: Text(
                                weatherPro.weatherModel.main.humidity.toString() +
                                    ' %',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                          ),
                          ListTile(
                            shape: Border(bottom: BorderSide(width: 0.5, color: AllColor.appBarColor)),
                            leading: Icon(Icons.where_to_vote),
                            title: Text('Wind Speed',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                            trailing: Text(
                                weatherPro.weatherModel.wind.speed.toString() +
                                    ' m/s',
                                style: TextStyle(
                                    color: AllColor.fontColor, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
