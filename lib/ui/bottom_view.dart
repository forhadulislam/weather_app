import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/ui/forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.listData;

  return Column(
    children: [
      Text(
        "7-day Weather Forecase".toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.brown),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: forecastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 160,
              child: forecastCard(snapshot, index),
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff9661C3), Colors.black12],
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight
                )
              ),
            ),
          ),
        ),
      )
    ],
  );
}
