import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.listData;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${country}, ${city}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
          Text(
            "${Util.getFormattedDate(formattedDate)}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          getWeatherIcon(
            description: forecastList[0].weather[0].main,
            size: 200,
            color: Colors.brown,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastList[0].temp.day.toStringAsFixed(0)} °F ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "${forecastList[0].weather[0].description.toUpperCase()}",
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
                    Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].humidity.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown)
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecastList[0].temp.max.toStringAsFixed(0)} F"),
                    Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    ),
  );
  return midView;
}
