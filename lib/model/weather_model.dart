class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });

  WeatherModel.demo() {
    location = Location.demo();
    current = Current.demo();
  }

  late final Location location;
  late final Current current;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }

  // Helper getters for backward compatibility
  String get name => location.name;
  MainCompat get main => MainCompat(
        temp: current.tempC + 273.15, // Convert to Kelvin for compatibility
        humidity: current.humidity,
        pressure: current.pressureMb.toInt(),
        feelsLike: current.feelslikeC + 273.15,
        tempMin: current.tempC + 273.15, // Same as temp for current weather
        tempMax: current.tempC + 273.15, // Same as temp for current weather
      );

  List<WeatherCondition> get weather => [
        WeatherCondition(
          id: current.condition.code,
          main: _mapConditionToMain(current.condition.text),
          description: current.condition.text,
          icon: current.condition.icon,
        )
      ];

  WindCompat get wind => WindCompat(
        speed: current.windKph / 3.6, // Convert kph to m/s
        deg: current.windDegree,
      );

  String _mapConditionToMain(String conditionText) {
    String lower = conditionText.toLowerCase();
    if (lower.contains('rain') || lower.contains('drizzle')) return 'Rain';
    if (lower.contains('snow')) return 'Snow';
    if (lower.contains('cloud')) return 'Clouds';
    if (lower.contains('clear') || lower.contains('sunny')) return 'Clear';
    if (lower.contains('mist') ||
        lower.contains('fog') ||
        lower.contains('haze')) return 'Haze';
    return 'Clear';
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  Location.demo() {
    name = "";
    region = "";
    country = "";
    lat = 0.0;
    lon = 0.0;
    tzId = "";
    localtimeEpoch = 0;
    localtime = "";
  }

  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  Current.demo() {
    lastUpdatedEpoch = 0;
    lastUpdated = "";
    tempC = 0.0;
    tempF = 0.0;
    isDay = 1;
    condition = Condition.demo();
    windMph = 0.0;
    windKph = 0.0;
    windDegree = 0;
    windDir = "";
    pressureMb = 0.0;
    pressureIn = 0.0;
    precipMm = 0.0;
    precipIn = 0.0;
    humidity = 0;
    cloud = 0;
    feelslikeC = 0.0;
    feelslikeF = 0.0;
    visKm = 0.0;
    visMiles = 0.0;
    uv = 0.0;
    gustMph = 0.0;
    gustKph = 0.0;
  }

  late final int lastUpdatedEpoch;
  late final String lastUpdated;
  late final double tempC;
  late final double tempF;
  late final int isDay;
  late final Condition condition;
  late final double windMph;
  late final double windKph;
  late final int windDegree;
  late final String windDir;
  late final double pressureMb;
  late final double pressureIn;
  late final double precipMm;
  late final double precipIn;
  late final int humidity;
  late final int cloud;
  late final double feelslikeC;
  late final double feelslikeF;
  late final double visKm;
  late final double visMiles;
  late final double uv;
  late final double gustMph;
  late final double gustKph;

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'].toDouble();
    tempF = json['temp_f'].toDouble();
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'].toDouble();
    windKph = json['wind_kph'].toDouble();
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'].toDouble();
    pressureIn = json['pressure_in'].toDouble();
    precipMm = json['precip_mm'].toDouble();
    precipIn = json['precip_in'].toDouble();
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'].toDouble();
    feelslikeF = json['feelslike_f'].toDouble();
    visKm = json['vis_km'].toDouble();
    visMiles = json['vis_miles'].toDouble();
    uv = json['uv'].toDouble();
    gustMph = json['gust_mph'].toDouble();
    gustKph = json['gust_kph'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_updated_epoch'] = lastUpdatedEpoch;
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['uv'] = uv;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  Condition.demo() {
    text = "";
    icon = "";
    code = 0;
  }

  late final String text;
  late final String icon;
  late final int code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}

// Compatibility classes for existing UI code
class MainCompat {
  MainCompat({
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  final double temp;
  final int humidity;
  final int pressure;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
}

class WeatherCondition {
  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;
}

class WindCompat {
  WindCompat({
    required this.speed,
    required this.deg,
  });

  final double speed;
  final int deg;
}
