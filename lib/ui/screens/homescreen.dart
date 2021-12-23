import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/background.dart';
import 'package:weather_app/ui/widgets/dotted_loader.dart';
import 'package:weather_app/ui/widgets/progress_loader.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/date_time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getCurrentWeatherResult();
    context.read<WeatherProvider>().getHourlyWeatherResult();
    return Stack(
      children: [
        Background(),
        Consumer<WeatherProvider>(builder: (_, WeatherProvider weather, child) {
          return weather.status == Status.LOADED
              ? RefreshIndicator(
                  displacement: 30.0,
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 2));
                    weather.getCurrentWeatherResult();
                    context.read<WeatherProvider>().getHourlyWeatherResult();
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      children: [
                        AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              print(_animation.value);
                              return Transform.scale(
                                  scale: _animation.value,
                                  child: CityTile(
                                    result: weather.result,
                                  ));
                            }),

                        // DottedLoader(
                        //   size: Size(50, 50),
                        //   colors: [
                        //     AppColors.white,
                        //     AppColors.light_blue,
                        //     AppColors.gray,
                        //     AppColors.light_blue
                        //   ],
                        // ),

                        weather.hrStatus == Status.LOADED
                            ? TodayCardList(
                                data: weather.response,
                                title: "Next Two Days",
                                date: DateTimeFormat.toDateString(
                                    weather.result.result.dt),
                              )
                            : SizedBox.shrink(),
                        Footer(time: weather.result.result.dt),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: ProgressLoader(
                    colors: [
                      AppColors.light_blue,
                      AppColors.light_blue,
                      Colors.indigo.shade300,
                      Colors.indigo,
                      Colors.indigo.shade300
                    ],
                  ),
                );
        }),
      ],
    );
  }
}
