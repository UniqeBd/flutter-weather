import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/utills/all_colors.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({Key? key}) : super(key: key);

  @override
  _CurrentLocationPageState createState() => _CurrentLocationPageState();
}

String? initVal;
Position? position;
List<String> cityListHome = [
  "Dhaka",
  "khulna",
  "Sylhet",
  "Barishal",
  "Chittagong",
  "Rajshahi"
];

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
    // Automatically load weather for Dhaka as default
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherProvider>(context, listen: false).getCityList();
      Provider.of<WeatherProvider>(context, listen: false)
          .getWeatherData("Dhaka");
    });
  }

  @override
  Widget build(BuildContext context) {
    // if(position?.longitude==null)
    // Provider.of<WeatherProvider>(context,listen: false).getCityList();
    // Provider.of<WeatherProvider>(context,listen: false)
    //     .getWeatherDataByLatLong(position?.latitude,
    //     position?.longitude);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Current Weather"),
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<WeatherProvider>(
          builder: (context, weatherPro, child) {
            return WillPopScope(
              onWillPop: () async {
                weatherPro.backButtonPress();
                return true;
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Weather Display Section
                          if (weatherPro.isLoading)
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(8),
                              child: Center(
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 8),
                                    Text("Loading weather data..."),
                                  ],
                                ),
                              ),
                            )
                          else if (weatherPro.errorMessage != null)
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.red.shade200),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.error_outline,
                                      color: Colors.red, size: 32),
                                  SizedBox(height: 8),
                                  Text(
                                    weatherPro.errorMessage!,
                                    style:
                                        TextStyle(color: Colors.red.shade800),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          else if (weatherPro
                              .weatherModel.current.condition.text.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    weatherPro.weatherModel.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            weatherPro
                                                    .weatherModel.current.tempC
                                                    .toStringAsFixed(1) +
                                                '°C',
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade700,
                                            ),
                                          ),
                                          Text(
                                            weatherPro.weatherModel.current
                                                .condition.text,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Humidity: ${weatherPro.weatherModel.current.humidity}%'),
                                          Text(
                                              'Wind: ${weatherPro.weatherModel.current.windKph.toStringAsFixed(1)} km/h'),
                                          Text(
                                              'Pressure: ${weatherPro.weatherModel.current.pressureMb.toStringAsFixed(0)} mb'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          SizedBox(height: 10),

                          // City Selection Section
                          Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 38,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0,
                                          right: 8,
                                          bottom: 8,
                                          top: 8),
                                      child: DropdownButton(
                                        iconDisabledColor: Colors.white,
                                        iconEnabledColor: Colors.white,
                                        hint: Text(
                                          "Select City",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        items: weatherPro.cityList
                                            .map((val) => DropdownMenuItem(
                                                value: val,
                                                child: Text(
                                                  val,
                                                )))
                                            .toList(),
                                        onChanged: (newVal) {
                                          initVal = newVal.toString();
                                          weatherPro.changeValue(initVal);
                                          // Automatically load weather when city is selected
                                          weatherPro.getWeatherData(initVal!);
                                        },
                                        value: initVal,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (initVal != null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage(
                                                          dVal: initVal!)));
                                        }
                                      },
                                      child: Text("View Details"))
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,
                                children: [
                                  for (int i = 0; i < 6; i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          // Load weather data first, then navigate
                                          weatherPro
                                              .getWeatherData(cityListHome[i]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage(
                                                          dVal: cityListHome[
                                                              i])));
                                        },
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          child: Center(
                                              child: Text(
                                            cityListHome[i],
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/image/btn.jpg",
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    ),
                                ]),
                          )

                          // Row(
                          //   children: [
                          //     Container(
                          //       height: height / 2.8,
                          //       width: width / 1.8,
                          //       child: Image.asset(weather == 'Rain'
                          //           ? "assets/gif/day-rain.gif"
                          //           : weather == 'Haze'
                          //           ? 'assets/gif/day-cold.gif'
                          //           : weather == 'Clear'
                          //           ? 'assets/gif/hot.gif'
                          //           : weather == 'Clouds'
                          //           ? 'assets/gif/day-cloud.gif'
                          //           : "assets/gif/day-cloud.gif"),
                          //     ),
                          //     Column(
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.only(bottom: 10.0),
                          //           child: Text(
                          //             weatherPro.weatherModel.name,
                          //             style: TextStyle(
                          //                 fontSize: 30, color: AllColor.appBarColor),
                          //           ),
                          //         ),
                          //         Text(
                          //           (weatherPro.weatherModel.main.temp - 273)
                          //               .toStringAsFixed(2) +
                          //               ' \u00B0' +
                          //               'C',
                          //           style: TextStyle(
                          //               fontSize: 34, color: AllColor.appBarColor),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(top: 10.0),
                          //           child: Text(
                          //             weather,
                          //             style: TextStyle(
                          //                 fontSize: 30, color: AllColor.appBarColor),
                          //           ),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
        // Consumer<WeatherProvider>(
        //   builder: (context, wProvider,child){
        //
        //     return Center(
        //       child: Container(
        //         child:
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(wProvider.weatherModel.name),
        //             DropdownButton(
        //               hint: Text("Select City"),
        //                 items: wProvider.cityList.map(
        //                         (val) => DropdownMenuItem(
        //                           value: val,
        //                             child: Text(val)
        //                         )
        //                 ).toList(),
        //
        //               onChanged: (newVal){
        //                 initVal=newVal.toString();
        //                wProvider.changeValue(initVal);
        //
        //               },
        //               value: initVal,
        //             ),
        //             ElevatedButton(
        //                 onPressed: (){
        //                   Navigator.push(context,
        //                       MaterialPageRoute(
        //                           builder: (context)=>
        //                               MyHomePage(dVal:
        //                               initVal.toString())));
        //                 },
        //                 child: Text("Get Weather"))
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // )
        );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }
}
