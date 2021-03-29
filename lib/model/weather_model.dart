class WeatherModel {
  String cod;
  int message;
  int cnt;
  List<Lists> lists;
  City city;

  WeatherModel({
      this.cod, 
      this.message, 
      this.cnt, 
      this.lists,
      this.city});

  WeatherModel.fromJson(dynamic json) {
    cod = json["cod"];
    message = json["message"];
    cnt = json["cnt"];
    if (json["list"] != null) {
      lists = [];
      json["list"].forEach((v) {
        lists.add(Lists.fromJson(v));
      });
    }
    city = json["city"] != null ? City.fromJson(json["city"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cod"] = cod;
    map["message"] = message;
    map["cnt"] = cnt;
    if (lists != null) {
      map["list"] = lists.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map["city"] = city.toJson();
    }
    return map;
  }

}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
      this.id, 
      this.name, 
      this.coord, 
      this.country, 
      this.population, 
      this.timezone, 
      this.sunrise, 
      this.sunset});

  City.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    coord = json["coord"] != null ? Coord.fromJson(json["coord"]) : null;
    country = json["country"];
    population = json["population"];
    timezone = json["timezone"];
    sunrise = json["sunrise"];
    sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    if (coord != null) {
      map["coord"] = coord.toJson();
    }
    map["country"] = country;
    map["population"] = population;
    map["timezone"] = timezone;
    map["sunrise"] = sunrise;
    map["sunset"] = sunset;
    return map;
  }

}

class Coord {
  double lat;
  double lon;

  Coord({
      this.lat, 
      this.lon});

  Coord.fromJson(dynamic json) {
    lat = json["lat"];
    lon = json["lon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lon"] = lon;
    return map;
  }

}

class Lists {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Sys sys;
  String dtTxt;

  Lists({
      this.dt, 
      this.main, 
      this.weather, 
      this.clouds, 
      this.wind, 
      this.visibility, 
      this.pop, 
      this.sys, 
      this.dtTxt});

  Lists.fromJson(dynamic json) {
    dt = json["dt"];
    main = json["main"] != null ? Main.fromJson(json["main"]) : null;
    if (json["weather"] != null) {
      weather = [];
      json["weather"].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    clouds = json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null;
    wind = json["wind"] != null ? Wind.fromJson(json["wind"]) : null;
    visibility = json["visibility"];
    pop = json["pop"].toDouble();
    sys = json["sys"] != null ? Sys.fromJson(json["sys"]) : null;
    dtTxt = json["dt_txt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["dt"] = dt;
    if (main != null) {
      map["main"] = main.toJson();
    }
    if (weather != null) {
      map["weather"] = weather.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map["clouds"] = clouds.toJson();
    }
    if (wind != null) {
      map["wind"] = wind.toJson();
    }
    map["visibility"] = visibility;
    map["pop"] = pop;
    if (sys != null) {
      map["sys"] = sys.toJson();
    }
    map["dt_txt"] = dtTxt;
    return map;
  }

}

class Sys {
  String pod;

  Sys({
      this.pod});

  Sys.fromJson(dynamic json) {
    pod = json["pod"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["pod"] = pod;
    return map;
  }

}

class Wind {
  double speed;
  int deg;

  Wind({
      this.speed, 
      this.deg});

  Wind.fromJson(dynamic json) {
    speed = json["speed"];
    deg = json["deg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["speed"] = speed;
    map["deg"] = deg;
    return map;
  }

}

class Clouds {
  int all;

  Clouds({
      this.all});

  Clouds.fromJson(dynamic json) {
    all = json["all"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["all"] = all;
    return map;
  }

}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
      this.id, 
      this.main, 
      this.description, 
      this.icon});

  Weather.fromJson(dynamic json) {
    id = json["id"];
    main = json["main"];
    description = json["description"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["main"] = main;
    map["description"] = description;
    map["icon"] = icon;
    return map;
  }

}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;

  Main({
      this.temp, 
      this.feelsLike, 
      this.tempMin, 
      this.tempMax, 
      this.pressure, 
      this.seaLevel, 
      this.grndLevel, 
      this.humidity, 
      });

  Main.fromJson(dynamic json) {
    temp = json["temp"];
    feelsLike = json["feels_like"];
    tempMin = json["temp_min"];
    tempMax = json["temp_max"];
    pressure = json["pressure"];
    seaLevel = json["sea_level"];
    grndLevel = json["grnd_level"];
    humidity = json["humidity"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["temp"] = temp;
    map["feels_like"] = feelsLike;
    map["temp_min"] = tempMin;
    map["temp_max"] = tempMax;
    map["pressure"] = pressure;
    map["sea_level"] = seaLevel;
    map["grnd_level"] = grndLevel;
    map["humidity"] = humidity;
    return map;
  }

}