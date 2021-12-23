import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather_app/data/datasource/apiservice.dart';
import 'package:weather_app/data/datasource/response.dart';
import 'package:weather_app/data/datasource/service.dart';
import 'package:weather_app/data/models/models.dart';

enum Status { INITIAL, LOADING, LOADED, ERROR }

class WeatherProvider extends ChangeNotifier {
  Status _status = Status.INITIAL;
  Status _hrStatus = Status.INITIAL;
  Status _dailyStatus = Status.INITIAL;
  Client _client;
  Service _service;
  WeatherResponse<CurrentWeatherResult> _result;
  WeatherResponse<PredictedHourlyWeatherResponse> _response;
  WeatherResponse<PredictedDailyWeatherResponse> _dailyResponse;
  String _currentCity = "karachi";
  var lat = 24.76;
  var lng = 67.011;

  WeatherProvider() {
    _client = Client();
    _service = ApiService(_client);
  }

  set city(String city) {
    _currentCity = city;

    notifyListeners();
  }

  String get city => _currentCity;

  set status(Status status) {
    _status = status;
  }

  set hrStatus(Status status) {
    _hrStatus = status;
  }

  set dailyStatus(Status status) {
    _dailyStatus = status;
  }

  Status get status => _status;
  Status get hrStatus => _hrStatus;
  Status get dailyStatus => _dailyStatus;

  WeatherResponse<CurrentWeatherResult> get result => _result;
  WeatherResponse<PredictedHourlyWeatherResponse> get response => _response;
  WeatherResponse<PredictedDailyWeatherResponse> get dailyResult =>
      _dailyResponse;
  getCurrentWeatherResult() async {
    _status = Status.LOADING;
    print(status);
    await Future.delayed(Duration(milliseconds: 1000));
    _result = await _service.getCurrentWeatherResult(_currentCity);
    this.lat = _result.result.coord.lat;
    this.lng = _result.result.coord.lon;
    print("{$lat and $lng}");
    _status = Status.LOADED;
    print(status);

    notifyListeners();
  }

  getHourlyWeatherResult() async {
    _hrStatus = Status.LOADING;
    _response = await _service
        .getTwoDaysForecast(Coordinates(lat: this.lat, lon: this.lng));
    print(_response.result.hourly.length);
    _hrStatus = Status.LOADED;
    notifyListeners();
  }

  getDailyWeatherResult() async {
    _dailyStatus = Status.LOADING;
    _dailyResponse = await _service
        .getSevenDaysForecast((Coordinates(lat: this.lat, lon: this.lng)));
    print(_dailyResponse.result.daily[0].dt);
    _dailyStatus = Status.LOADED;
    notifyListeners();
  }
}
