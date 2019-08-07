import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/screens/main_screen.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/shared_pref.dart';
import 'package:smartnotes/utils/theme_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      builder: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          SharedPrefUtils.getF(Constants.DARK_MODE).then((isDarkMode) {
            themeNotifier.setdarkMode(isDarkMode);
          });
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: themeNotifier.isDarkMode ?? false
                    ? Brightness.dark
                    : Brightness.light),
            home: MainScreen(title: Constants.APP_NAME),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
