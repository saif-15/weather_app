import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                children: [
                  Icon(
                    MdiIcons.magnify,
                    color: AppColors.gray,
                  ),
                  const HorizontalSpacing(width: 5.0),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: AppColors.white),
                      decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.grey),
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
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Icon(
                MdiIcons.mapMarkerOutline,
                color: AppColors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
