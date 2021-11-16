class WeatherResponse<T> {
  T result;
  String status;
  int statusCode;
  String message;

  WeatherResponse({this.result, this.status,this.message,this.statusCode});
}
