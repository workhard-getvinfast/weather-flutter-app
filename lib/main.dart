import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather_model.dart';
import 'package:flutter_app/ultis/get_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherModel> _getWeather;
  double lat = 21.034001;
  double lon = 105.788564;
  String appId = "787455bdbade1a94593eb5fb337f0f1f";

  @override
  void initState() {
    super.initState();
    _getWeather = fetchWeather(lat, lon, appId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather Now",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.indigo[50],
      ),
      body: FutureBuilder<WeatherModel>(
        future: _getWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return hasDataWidget(snapshot);
          }
          if (snapshot.hasError) {
            return hasErrWidget(snapshot);
          }
          return loadWidget();
        },
      ),
    );
  }

  Widget hasDataWidget(AsyncSnapshot<WeatherModel> snapshot) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("https://openweathermap.org/img/wn/${snapshot.data.lists[0].weather[0].icon}@2x.png"),
              Text(
                "${snapshot.data.lists[0].main.temp} °C",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),
          Text(
            "${snapshot.data.lists[0].weather[0].main}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Colors.black
            ),
          ),
          Text(
            "${snapshot.data.lists[0].weather[0].description}, feel like ${snapshot.data.lists[0].main.feelsLike} °C",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 26,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }

  Widget hasErrWidget(AsyncSnapshot<WeatherModel> snapshot) {
    return Center(
      child: //Text("${snapshot.error}"),
        Text("Somethings wrong. Please check your internet connection and restart this app again.")
    );
  }

  Widget loadWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Loading weather data")
          ],
        )
    );
  }
}
