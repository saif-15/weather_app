class TempConverter {
  TempConverter._();

  static double toCelsius(double temp) {
    return ((temp - 32) * 5 / 9);
  }

  static double toFarenheit(double temp) {
    return ((temp * 9 / 5) + 32).ceilToDouble();
  }
}
