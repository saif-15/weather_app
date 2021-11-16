import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/vertical_spacing.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/date_time.dart';
import 'package:weather_app/utils/image_helper.dart';

class TodayCardList extends StatelessWidget {
  const TodayCardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getHourlyWeatherResult();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              "Next Two Days Forecast",
              style: TextStyle(
                  color: AppColors.white.withOpacity(0.8), fontSize: 16.0),
            ),
          ),
          VerticalSpacing(height: 10.0),
          Container(
            child: Center(
              child: Consumer<WeatherProvider>(
                builder: (_, WeatherProvider weather, child) {
                  return weather.hrStatus == Status.LOADED
                      ? ListView.builder(
                          itemCount: weather.response.result.hourly.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return _ItemCard(
                              image: ImageHelper.getImagePath(
                                  weather.response.result.hourly[index]
                                      .weather[0].main,
                                  weather.response.result.hourly[index].dt),
                              temp: weather.response.result.hourly[index].temp
                                  .toString(),
                              time: DateTimeFormat.to12HoursTimeString(
                                  weather.response.result.hourly[index].dt),
                            );
                          },
                        )
                      : DottedLoader(
                          size: Size(40, 40),
                          colors: [
                            Colors.blue,
                            Colors.black,
                            Colors.black38,
                            Colors.white
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final String image;
  final String time;
  final String temp;
  const _ItemCard({Key key, this.image, this.time, this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          gradient: LinearGradient(colors: [
            AppColors.light_blue.withOpacity(0.7),
            AppColors.light_blue,
          ])),
      child: Row(
        children: [
          SizedBox(
            child: Lottie.asset(image),
            width: 40.0,
            height: 40.0,
          ),
          HorizontalSpacing(
            width: 16.0,
          ),
          Column(
            children: [
              Text(
                time,
                style: TextStyle(color: AppColors.white, fontSize: 12.0),
              ),
              Text(
                temp + "\u2103",
                style: TextStyle(color: AppColors.white, fontSize: 16.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
