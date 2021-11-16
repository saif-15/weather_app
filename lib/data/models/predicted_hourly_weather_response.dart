import 'package:weather_app/data/models/models.dart';

class PredictedHourlyWeatherResponse {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Hourly> hourly;

  PredictedHourlyWeatherResponse(
      {this.lat, this.lon, this.timezone, this.timezoneOffset, this.hourly});

  PredictedHourlyWeatherResponse.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];

    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly.add(Hourly.fromJson(v));
      });
    }
  }
}
