import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeuomorph_mobile_banking/statistic_light_screen.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/utils/theme_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider<ThemeSettings>(
              create: (context) => ThemeSettings(snapshot.data),
              child: App(),
            );
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme();
    return MaterialApp(
        theme: theme.getTheme(Provider.of<ThemeSettings>(context).isDarkMode),
        home: StatisticLightScreen());
  }
}
