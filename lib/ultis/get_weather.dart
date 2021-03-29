import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/weather_model.dart';

Future<WeatherModel> fetchWeather(
    double lat,
    double lon,
    String appId) async {
    var parameter = <String, String>{
      "lat":lat.toString(),
      "lon":lon.toString(),
      "appid":appId,
      "units":"metric"
    };
    final response = await http.get(Uri.https(
      "api.openweathermap.org",
      "/data/2.5/forecast",
      parameter)
    );
    if(response.statusCode == 200){
      return WeatherModel.fromJson(jsonDecode(response.body));
    }
    else {
      return null;
    }
}
