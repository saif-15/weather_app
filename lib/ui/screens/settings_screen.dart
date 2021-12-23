import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/settings_chips.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Background(),
      SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VerticalSpacing(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          VerticalSpacing(
            height: 16.0,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time Format",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(height: 15.0),
                  Row(
                    children: [
                      SettingsChip(
                        content: "01:00 PM",
                      ),
                      HorizontalSpacing(
                        width: 10.0,
                      ),
                      SettingsChip(
                        content: "13:00",
                      ),
                    ],
                  ),
                  // SEcond Option
                  VerticalSpacing(
                    height: 40.0,
                  ),
                  Text(
                    "Temperature",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(height: 15.0),
                  Row(
                    children: [
                      SettingsChip(
                        content: "Fahrenheit",
                      ),
                      HorizontalSpacing(
                        width: 10.0,
                      ),
                      SettingsChip(
                        content: "Celsius",
                      ),
                    ],
                  ),
                  // Third Option
                  VerticalSpacing(
                    height: 40.0,
                  ),
                  Text(
                    "Wind Speed",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(height: 15.0),
                  Row(
                    children: [
                      SettingsChip(
                        content: "km/h",
                      ),
                      HorizontalSpacing(
                        width: 10.0,
                      ),
                      SettingsChip(
                        content: "mph",
                      ),
                    ],
                  ),
                  VerticalSpacing(
                    height: 50.0,
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpacing(
                    height: 10,
                  ),
                  Text(
                    "This app is build using openweather api.This is opensource project feel free to contribute",
                    style: TextStyle(color: AppColors.gray),
                  )
                ],
              ))
        ]),
      ))
    ]);
  }
}
