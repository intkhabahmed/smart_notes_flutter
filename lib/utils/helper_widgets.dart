import 'package:flutter/material.dart';

class HelperWidgets {
  static Widget getAlertDialog(BuildContext context) {
    return AlertDialog(
          title: Text('Are you sure want to quit the app?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        );
  }
}