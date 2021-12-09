import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context,weatherPro,child){
          return Center(
            child:
                weatherPro.isLoading?
                CircularProgressIndicator():
            Column(
              children: [
                if(weatherPro.weatherModel.weather[0].main=="Haze")
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/gif/day-cloud.gif"),
                )
                else if(weatherPro.weatherModel.weather[0].main=="Clouds")
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/gif/night-cloud.gif"),
                  ) ,
                Text(weatherPro.weatherModel.name),
                Text(weatherPro.weatherModel.weather[0].main),
              ],
            )
          );
        },
      ),
    );
  }
}
