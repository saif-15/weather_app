import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class SearchBox extends StatefulWidget {
  SearchBox({Key key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    MdiIcons.magnify,
                    color: AppColors.gray,
                  ),
                  const HorizontalSpacing(width: 10.0),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        weatherProvider.city = value.trim();
                      },
                      controller: _controller,
                      style: TextStyle(color: AppColors.white),
                      decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 16.0, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'Search City'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HorizontalSpacing(
            width: 6.0,
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                weatherProvider.getCurrentWeatherResult();
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Icon(
                  MdiIcons.mapMarkerOutline,
                  color: AppColors.gray,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
