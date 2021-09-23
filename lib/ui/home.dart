import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/bottom_view.dart';

import 'mid_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Helsinki";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeatherData(cityName: _cityName);
    /*forecastObject.then((weather) {
      print(weather.city);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                  print("render started");
                  print(forecastObject);
                  print(snapshot.hasData);
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        midView(snapshot),
                        bottomView(snapshot, context)
                      ],
                    );
                  }
                  print("else started");
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter city name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(6)),
          onSubmitted: (value) {
            setState(() {
              print(value);
              _cityName = value;
              forecastObject = getWeatherData(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeatherData({String cityName}) => new Network().getWeatherData(cityName: cityName);
}
