import 'package:weather_app/data/models/models.dart';

class PredictedDailyWeatherResponse {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Daily> daily;

  PredictedDailyWeatherResponse(
      {this.lat, this.lon, this.timezone, this.timezoneOffset, this.daily});

  PredictedDailyWeatherResponse.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
  }
}
