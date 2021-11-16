import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/background.dart';
import 'package:weather_app/ui/widgets/dotted_loader.dart';
import 'package:weather_app/ui/widgets/progress_loader.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var city = 'karachi';
  var lat;
  var lng;
  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getCurrentWeatherResult(city);
    return Stack(
      children: [
        Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<WeatherProvider>(
                builder: (_, WeatherProvider weather, child) {
              return weather.status == Status.LOADING
                  ? Center(
                      child: ProgressLoader(
                        colors: [
                          AppColors.light_blue,
                          AppColors.light_blue,
                          Colors.indigo.shade300,
                          Colors.indigo,
                          Colors.indigo.shade300
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      displacement: 30.0,
                      onRefresh: () async {
                        lat = weather.result.result.coord.lat;
                        lng = weather.result.result.coord.lon;
                        await Future.delayed(Duration(seconds: 2));
                        context
                            .read<WeatherProvider>()
                            .getCurrentWeatherResult("islamabad");
                      },
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Column(
                          children: [
                            CityTile(
                              result: weather.result,
                            ),

                            // Footer(time: weather.result.result.dt),
                          ],
                        ),
                      ),
                    );
            }),
            TodayCardList()
          ],
        ),
      ],
    );
  }
}
