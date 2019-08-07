import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:smartnotes/utils/constants.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            Constants.APP_DESCRIPTION,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            Constants.APP_FEATURES,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform().then((info) => info.version),
            builder: (context, AsyncSnapshot<String> text) {
              return Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    "App Version - ${text.data}",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
