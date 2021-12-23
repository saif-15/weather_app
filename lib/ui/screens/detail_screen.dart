import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/date_time.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getDailyWeatherResult();
    return Stack(
      children: [
        Background(),
        SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            children: [
              VerticalSpacing(
                height: 16.0,
              ),
              Text(
                "Forecast Report",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                height: 10.0,
              ),
              Consumer<WeatherProvider>(builder: (content, weather, child) {
                return weather.hrStatus == Status.LOADED
                    ? TodayCardList(
                        title: "Today",
                        date: DateTimeFormat.toDateString(
                            weather.response.result.hourly[0].dt),
                        data: weather.response,
                      )
                    : DottedLoader(
                        colors: [
                          AppColors.white,
                          AppColors.gray,
                          AppColors.light_blue,
                          AppColors.gray
                        ],
                        size: Size(60.0, 60.0),
                      );
              }),
              VerticalSpacing(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      "Next Forecast",
                      style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 16.0),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Icon(
                        Icons.calendar_today,
                        color: AppColors.gray,
                      ))
                ],
              ),
              Expanded(child: Consumer<WeatherProvider>(
                builder: (content, weather, child) {
                  return weather.dailyStatus == Status.LOADED
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: weather.dailyResult.result.daily.length,
                          itemBuilder: (_, index) {
                            var daily = weather.dailyResult.result.daily[index];
                            return DetailCard(
                              main: daily.weather[0].main,
                              temp: daily.temp.day.toString(),
                              time: daily.dt,
                            );
                          })
                      : DottedLoader(
                          colors: [
                            AppColors.white,
                            AppColors.gray,
                            AppColors.light_blue,
                            AppColors.gray
                          ],
                          size: Size(60.0, 60.0),
                        );
                },
              ))
            ],
          ),
        )),
      ],
    );
  }
}
