import 'package:weather_app/data/datasource/response.dart';
import 'package:weather_app/data/models/models.dart';

abstract class Service {
  Future<WeatherResponse<CurrentWeatherResult>> getCurrentWeatherResult(
      String city);

  Future<WeatherResponse<PredictedDailyWeatherResponse>> getSevenDaysForecast(
      Coordinates coordinates);

  Future<WeatherResponse<PredictedHourlyWeatherResponse>> getTwoDaysForecast(
      Coordinates coordinates);

  Future<WeatherResponse<PredictedMinutelyWeatherResponse>> getMinutelyForecast(
      Coordinates coordinates);
}
