import 'package:flutter/material.dart';
import 'package:weather_app/utils/date_time.dart';

class ImageHelper {
  static final icons = [
    "assets/weather_clouds.json",
    "assets/weather_cloudy_night.json",
    "assets/weather_foggy.json",
    "assets/weather_lightning.json",
    "assets/weather_mist.json",
    "assets/weather_night.json",
    "assets/weather_partly_cloudy.json",
    "assets/weather_partly_shower.json",
    "assets/weather_rainy_night.json",
    "assets/weather_snow_sunny.json",
    "assets/weather_snow.json",
    "assets/weather_storm.json",
    "assets/weather_stormshowersday.json",
    "assets/weather_sunny.json",
    "assets/weather_snow_night.json"
  ];

  static String getImagePath(String weather, int timestamp) {
    bool isDay = DateTimeFormat.isDay(timestamp);
    String image = icons[13];
    switch (weather) {
      case "Thunderstorm":
        image = isDay ? icons[12] : icons[11];
        break;

      case "Clear":
        image = isDay ? icons[13] : icons[5];
        break;

      case "Clouds":
        image = isDay ? icons[0] : icons[1];
        break;

      case "Rain":
        image = isDay ? icons[7] : icons[8];
        break;

      case "Snow":
        image = isDay ? icons[9] : icons[14];
        break;

      case "Mist":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Smoke":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Haze":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Dust":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Foggy":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Sand":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Ash":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Squall":
        image = isDay ? icons[2] : icons[4];
        break;

      case "Tornado":
        image = icons[3];
        break;

      case "Drizzle":
        image = isDay ? icons[7] : icons[8];
        break;

      default:
        image = icons[13];
        break;
    }
    return image;
  }
}
