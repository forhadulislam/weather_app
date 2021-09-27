import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/ui/forecast_card.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            itemCount: snapshot.data.listData.length,
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
}