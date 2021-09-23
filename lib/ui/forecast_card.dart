import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.listData;
  var dayOfWeek = "";
  var fullDate = Util.getFormattedDate(
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${dayOfWeek}",
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                  description: forecastList[index].weather[0].main,
                  color: Colors.brown),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].temp.min.toStringAsFixed(0)} F"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.brown, size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].temp.max.toStringAsFixed(0)} F"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.brown, size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Hum: ${forecastList[index].humidity.toStringAsFixed(0)}%"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Wind: ${forecastList[index].speed.toStringAsFixed(1)} mi/h"),
                  ],
                ),
              )
            ],
          )
        ],
      ),

    ],
  );
}
