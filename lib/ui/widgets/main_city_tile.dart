import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/datasource/response.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/widgets/vertical_spacing.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/date_time.dart';
import 'package:weather_app/utils/image_helper.dart';

class CityTile extends StatefulWidget {
  final WeatherResponse<CurrentWeatherResult> result;
  CityTile({Key key, this.result}) : super(key: key);

  @override
  _CityTileState createState() => _CityTileState();
}

class _CityTileState extends State<CityTile> {
  var isCurrent = true;

  final _tabOne = ['Main', 'Clouds', 'Humidity', 'Temp', 'Wind', 'Visibility'];
  final _tabTwo = [
    'Feels Like',
    'Min Temp',
    'Max Temp',
    'Pressure',
    'Sunrise',
    'Sunset'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalSpacing(
              height: 16.0,
            ),
            Text(
              widget.result.result.name,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            VerticalSpacing(
              height: 10.0,
            ),
            Text(
              DateTimeFormat.toDateString(widget.result.result.dt),
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal),
            ),
            VerticalSpacing(
              height: 6.0,
            ),
            Text(
              DateTimeFormat.toWeekDay(widget.result.result.dt),
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal),
            ),
            VerticalSpacing(
              height: 20.0,
            ),
            Container(
                height: 35.0,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                margin: EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCurrent = true;
                        });
                      },
                      child: Container(
                        height: 35.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: isCurrent
                                ? [
                                    BoxShadow(
                                        color: AppColors.dark_blue,
                                        blurRadius: 20.0,
                                        offset: Offset(0.0, 0.0),
                                        spreadRadius: 1.0)
                                  ]
                                : null,
                            color: isCurrent
                                ? AppColors.light_blue
                                : Colors.transparent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Current",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCurrent = false;
                        });
                      },
                      child: Container(
                        height: 35.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            boxShadow: !isCurrent
                                ? [
                                    BoxShadow(
                                        color: AppColors.dark_blue,
                                        blurRadius: 20.0,
                                        offset: Offset(0.0, 0.0),
                                        spreadRadius: 1.0)
                                  ]
                                : null,
                            color: isCurrent
                                ? Colors.transparent
                                : AppColors.light_blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          "Details",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ])),
            VerticalSpacing(
              height: 16.0,
            ),
            Lottie.asset(
                ImageHelper.getImagePath(widget.result.result.weather[0].main,
                    widget.result.result.dt),
                height: 300.0,
                width: 250.0),
            TemperatureCard(
              titles: isCurrent ? _tabOne : _tabTwo,
              data: widget.result,
              isTabbed: isCurrent,
            )
          ],
        ),
      ),
    );
  }
}

class TemperatureCard extends StatelessWidget {
  final WeatherResponse<CurrentWeatherResult> data;
  final List<String> titles;
  final bool isTabbed;
  const TemperatureCard({Key key, this.isTabbed, this.titles, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 1st Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tile(
                title: titles[0],
                value: isTabbed
                    ? data.result.weather[0].main
                    : "${data.result.main.feelsLike} \u2103",
              ),
              Tile(
                title: titles[1],
                value: isTabbed
                    ? "${data.result.clouds.all} %"
                    : "${data.result.main.tempMin} \u2103",
              ),
              Tile(
                title: titles[2],
                value: isTabbed
                    ? "${data.result.main.humidity} %"
                    : "${data.result.main.tempMax} \u2103",
              )
            ],
          ),
          VerticalSpacing(
            height: 20.0,
          ),
          // 2nd Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tile(
                title: titles[3],
                value: isTabbed
                    ? "${data.result.main.temp} \u2103"
                    : "${data.result.main.pressure}",
              ),
              Tile(
                  title: titles[4],
                  value: isTabbed
                      ? "${data.result.wind.speed}km/h"
                      : "${DateTimeFormat.to12HoursTimeString(data.result.sys.sunrise)}",
                  child: isTabbed
                      ? Arrow(
                          angle: double.parse(data.result.wind.deg.toString()),
                        )
                      : SizedBox.shrink()),
              Tile(
                title: titles[5],
                value: isTabbed
                    ? "${data.result.visibility} m"
                    : "${DateTimeFormat.to12HoursTimeString(data.result.sys.sunset)}",
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final String value;
  final Widget child;
  const Tile({Key key, this.title, this.value, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Colors.white.withOpacity(0.2))),
      onPressed: () {},
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors.white.withOpacity(0.8)),
          ),
          VerticalSpacing(
            height: 2.0,
          ),
          Row(
            children: [
              Text(value,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              child ?? SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}
