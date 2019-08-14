import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/shared_pref.dart';
import 'package:smartnotes/utils/theme_notifier.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Dark Mode",
                style: TextStyle(fontSize: 18.0),
              ),
              Consumer<ThemeNotifier>(
                builder: (context, notifier, _) {
                  return Switch(
                    value: notifier.isDarkMode ?? false,
                    onChanged: (isOn) {
                      SharedPrefUtils.setBool(Constants.DARK_MODE, isOn)
                          .then((isDarkMode) {
                        setState(() {
                          Provider.of<ThemeNotifier>(context, listen: false)
                              .setdarkMode(isDarkMode);
                        });
                      });
                    },
                  );
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
