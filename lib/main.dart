import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/screens/main_screen.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/db_notifier.dart';
import 'package:smartnotes/utils/shared_pref.dart';
import 'package:smartnotes/utils/theme_notifier.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>.value(
          value: ThemeNotifier(),
        ),
        ChangeNotifierProvider<DBNotifier>.value(
          value: DBNotifier(),
        ),
      ],
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
