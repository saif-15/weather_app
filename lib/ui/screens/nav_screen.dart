import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/navigation.dart';
import 'package:weather_app/ui/screens/homescreen.dart';
import 'package:weather_app/ui/screens/screens.dart';
import 'package:weather_app/ui/widgets/wigdets.dart';
import 'package:weather_app/utils/colors.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    DetailScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  final List<IconData> _icons = [
    MdiIcons.homeVariant,
    MdiIcons.cardMultiple,
    MdiIcons.magnify,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    final navigation_provider = Provider.of<Navigation>(context);
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        body: IndexedStack(
          children: _screens,
          index: navigation_provider.index,
        ),
        bottomNavigationBar: Material(
          color: AppColors.dark_blue,
          child: CustomBottomBar(
              icons: _icons,
              selectedIndex: navigation_provider.index,
              onTap: (index) => navigation_provider.index = index),
        ),
      ),
    );
  }
}
