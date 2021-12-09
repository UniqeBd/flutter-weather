import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_page.dart';
class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({Key? key}) : super(key: key);

  @override
  _CurrentLocationPageState createState() => _CurrentLocationPageState();
}

String? initVal;
class _CurrentLocationPageState extends State<CurrentLocationPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherProvider>(context,listen: false).getCityList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:
      Consumer<WeatherProvider>(
        builder: (context, wProvider,child){

          return Center(
            child: Container(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: Text("Select City"),
                      items: wProvider.cityList.map(
                              (val) => DropdownMenuItem(
                                value: val,
                                  child: Text(val)
                              )
                      ).toList(),

                    onChanged: (newVal){
                      initVal=newVal.toString();
                     wProvider.changeValue(initVal);

                    },
                    value: initVal,
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>
                                    MyHomePage(dVal: initVal.toString())));
                      },
                      child: Text("Get Weather"))
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
