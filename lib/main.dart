import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ui/providers/navigation.dart';
import 'package:weather_app/ui/providers/weather_response_provider.dart';
import 'package:weather_app/ui/screens/screens.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherProvider()),
          ChangeNotifierProvider(create: (_) => Navigation())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.white,
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
            home: NavScreen()));
  }
}
