import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:weather_app/data/datasource/response.dart';
import 'package:weather_app/data/datasource/service.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/utils/constant.dart';

class ApiService extends Service {
  Client client;

  ApiService(this.client);

  @override
  Future<WeatherResponse<CurrentWeatherResult>> getCurrentWeatherResult(
      String city) async {
    final String url =
        "weather?q=$city&units=metric&appid=${Constants.API_KEY}";
    try {
      var response = await client.get(Uri.parse(Constants.BASE_URL + url));
      if (response.statusCode == 200) {
        var result = CurrentWeatherResult.fromJson(jsonDecode(response.body));
        await Future.delayed(Duration(milliseconds: 1200));
        return WeatherResponse<CurrentWeatherResult>(
            result: result,
            statusCode: response.statusCode,
            message: "Successfully fetched",
            status: "success");
      } else if (response.statusCode == 404) {
        return WeatherResponse<CurrentWeatherResult>(
            result: null,
            statusCode: response.statusCode,
            message: "location not found",
            status: "success");
      } else {
        return WeatherResponse<CurrentWeatherResult>(
            result: null,
            statusCode: response.statusCode,
            message: "Successfully fetched",
            status: "success");
      }
    } on SocketException {
      return WeatherResponse(
          message: "Error in network try again later",
          result: null,
          status: "unsuccessful",
          statusCode: 400);
    } on Exception {
      return WeatherResponse(
          message: "Something went wrong",
          result: null,
          status: "unsuccessful",
          statusCode: 401);
    }
  }

  @override
  Future<WeatherResponse<PredictedDailyWeatherResponse>> getSevenDaysForecast(
      Coordinates coordinates) async {
    final String url =
        "onecall?lat=${coordinates.lat}&lon=${coordinates.lon}&exclude=minutely,hourly,current&units=metric&appid=${Constants.API_KEY}";
    try {
      var response = await client.get(Uri.parse(Constants.BASE_URL + url));
      if (response.statusCode == 200) {
        var result =
            PredictedDailyWeatherResponse.fromJson(jsonDecode(response.body));
        await Future.delayed(Duration(milliseconds: 1200));
        return WeatherResponse(
            result: result,
            status: "successful",
            statusCode: 200,
            message: "Successfully fetched");
      } else {
        return WeatherResponse(
            result: null,
            status: "successful",
            statusCode: response.statusCode,
            message: "unsuccessfully fetched");
      }
    } on SocketException {
      return WeatherResponse(
          message: "Error in network try again later",
          result: null,
          status: "unsuccessful",
          statusCode: 400);
    } on Exception {
      return WeatherResponse(
          message: "Something went wrong",
          result: null,
          status: "unsuccessful",
          statusCode: 401);
    }
  }

  @override
  Future<WeatherResponse<PredictedHourlyWeatherResponse>> getTwoDaysForecast(
      Coordinates coordinates) async {
    final String url =
        "onecall?lat=${coordinates.lat}&lon=${coordinates.lon}&exclude=minutely,daily,current&units=metric&appid=${Constants.API_KEY}";
    try {
      var response = await client.get(Uri.parse(Constants.BASE_URL + url));
      if (response.statusCode == 200) {
        var result =
            PredictedHourlyWeatherResponse.fromJson(jsonDecode(response.body));
        await Future.delayed(Duration(milliseconds: 1200));
        return WeatherResponse(
            result: result,
            status: "successful",
            statusCode: 200,
            message: "Successfully fetched");
      } else {
        return WeatherResponse(
            result: null,
            status: "successful",
            statusCode: response.statusCode,
            message: "unsuccessfully fetched");
      }
    } on SocketException {
      return WeatherResponse(
          message: "Error in network try again later",
          result: null,
          status: "unsuccessful",
          statusCode: 400);
    } on Exception {
      WeatherResponse(
          message: "Something went wrong",
          result: null,
          status: "unsuccessful",
          statusCode: 401);
    }
  }

  @override
  Future<WeatherResponse<PredictedMinutelyWeatherResponse>> getMinutelyForecast(
      Coordinates coordinates) async {
    final String url =
        "onecall?lat=${coordinates.lat}&lon=${coordinates.lon}&exclude=hourly,daily,current&units=metric&appid=${Constants.API_KEY}";
    try {
      var response = await client.get(Uri.parse(Constants.BASE_URL + url));
      if (response.statusCode == 200) {
        var result = PredictedMinutelyWeatherResponse.fromJson(
            jsonDecode(response.body));
        await Future.delayed(Duration(milliseconds: 1200));
        return WeatherResponse(
            result: result,
            status: "successful",
            statusCode: 200,
            message: "Successfully fetched");
      } else {
        return WeatherResponse(
            result: null,
            status: "successful",
            statusCode: response.statusCode,
            message: "unsuccessfully fetched");
      }
    } on SocketException {
      return WeatherResponse(
          message: "Error in network try again later",
          result: null,
          status: "unsuccessful",
          statusCode: 400);
    } on Exception {
      WeatherResponse(
          message: "Something went wrong",
          result: null,
          status: "unsuccessful",
          statusCode: 401);
    }
  }
}
