import 'package:weather_app/data/models/models.dart';

class PredictedMinutelyWeatherResponse {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Minutely> minutely;

  PredictedMinutelyWeatherResponse(
      {this.lat, this.lon, this.timezone, this.timezoneOffset, this.minutely});

  PredictedMinutelyWeatherResponse.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];

    if (json['minutely'] != null) {
      minutely = [];
      json['minutely'].forEach((v) {
        minutely.add(Minutely.fromJson(v));
      });
    }
  }
}
