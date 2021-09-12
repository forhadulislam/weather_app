import 'dart:convert';

import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/forecast_util.dart';
import 'package:http/http.dart';

class Network{
  Future<WeatherForecastModel> getWeatherData({String cityName}) async{
    var units = "imperial";
    var baseUrl = "http://api.openweathermap.org/data/2.5/forecast/daily?";
    var finalUrl = baseUrl + "q=" + cityName + "&appid=" + Util.appId + "&units=" + units;
    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200){
      print("url: ${finalUrl}");
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather forecast");
    }
  }
}