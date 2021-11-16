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
  Client _client;
  Service _service;
  WeatherResponse<CurrentWeatherResult> _result;
  WeatherResponse<PredictedHourlyWeatherResponse> _response;
  String _currentCity = "";
  double lat = 26.0;
  double lng = 89.0;

  WeatherProvider() {
    _client = Client();
    _service = ApiService(_client);
  }

  set city(String city) {
    _currentCity = city;
  }

  String get city => _currentCity;

  set status(Status status) {
    _status = status;
  }

  set hrStatus(Status status) {
    _hrStatus = status;
  }

  Status get status => _status;
  Status get hrStatus => _hrStatus;

  WeatherResponse<CurrentWeatherResult> get result => _result;
  WeatherResponse<PredictedHourlyWeatherResponse> get response => _response;

  getCurrentWeatherResult(String city) async {
    status = Status.LOADING;
    await Future.delayed(Duration(milliseconds: 1000));
    _result = await _service.getCurrentWeatherResult(city);
    this.lat = _result.result.coord.lat;
    this.lng = _result.result.coord.lon;
    status = Status.LOADED;
    notifyListeners();
  }

  getHourlyWeatherResult() async {
    hrStatus = Status.LOADING;
    await Future.delayed(Duration(milliseconds: 1000));
    _response = await _service
        .getTwoDaysForecast(Coordinates(lat: this.lat, lon: this.lng));
    print(_response.result.hourly.length);
    hrStatus = Status.LOADED;
    notifyListeners();
  }
}
