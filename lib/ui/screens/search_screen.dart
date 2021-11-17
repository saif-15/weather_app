import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index % 2 == 1) {
                        return Transform.translate(
                          offset: Offset(0, 30),
                          child: GridItemCard(),
                        );
                      }
                      return GridItemCard();
                    },
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
