import 'package:flutter/material.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
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
                "Pick Locations",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              VerticalSpacing(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  "Find the area or city you want to know the detailed weather info at this time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              VerticalSpacing(
                height: 10.0,
              ),
              SearchBox(),
              VerticalSpacing(
                height: 10.0,
              ),
              Expanded(child: Consumer<WeatherProvider>(
                builder: (context, weather, child) {
                  return weather.status == Status.LOADED &&
                          weather.hrStatus == Status.LOADED
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 1,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              var result = weather.result.result;
                              return GridItemCard(
                                cityName: result.name,
                                main: result.weather[0].main,
                                temp: result.main.temp.toString(),
                                timestamp: result.dt,
                                minTemp: result.main.tempMin,
                                maxtemp: result.main.tempMax,
                              );
                            },
                          ),
                        )
                      : DottedLoader(
                          size: Size(50.0, 50.0),
                          colors: [
                            AppColors.gray,
                            AppColors.white,
                            AppColors.gray,
                            AppColors.light_blue
                          ],
                        );
                },
              ))
            ],
          ),
        ))
      ],
    );
  }
}
