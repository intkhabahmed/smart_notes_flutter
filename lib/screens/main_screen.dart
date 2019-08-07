import 'package:flutter/material.dart';
import 'package:smartnotes/fragments/about.dart';
import 'package:smartnotes/fragments/help.dart';
import 'package:smartnotes/fragments/home.dart';
import 'package:smartnotes/fragments/settings.dart';
import 'package:smartnotes/fragments/trash.dart';
import 'package:smartnotes/utils/constants.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedNavItem = Constants.HOME;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedNavItem == Constants.HOME
              ? widget.title
              : selectedNavItem),
          elevation:
              selectedNavItem == Constants.HOME ? 0.0 : AppBar().elevation,
          actions:
              selectedNavItem == Constants.HOME ? _createActionWidgets() : [],
        ),
        drawer: _makeDrawer(),
        body: _openNavItem(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _makeDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.speaker_notes,
                        size: 50.0,
                      ),
                      radius: 48.0,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.HOME),
              ],
            ),
            selected: selectedNavItem == Constants.HOME,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.HOME;
              });
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.delete),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.TRASH),
              ],
            ),
            selected: selectedNavItem == Constants.TRASH,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.TRASH;
              });
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.settings),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.SETTINGS),
              ],
            ),
            selected: selectedNavItem == Constants.SETTINGS,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.SETTINGS;
              });
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.help),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.HELP),
              ],
            ),
            selected: selectedNavItem == Constants.HELP,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.HELP;
              });
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.info),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.ABOUT),
              ],
            ),
            selected: selectedNavItem == Constants.ABOUT,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.ABOUT;
              });
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.security),
                SizedBox(
                  width: 20.0,
                ),
                Text(Constants.PRIVACY_POLICY),
              ],
            ),
            selected: selectedNavItem == Constants.PRIVACY_POLICY,
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = Constants.PRIVACY_POLICY;
              });
            },
          ),
        ],
      ),
    );
  }

  _openNavItem() {
    switch (selectedNavItem) {
      case Constants.HOME:
        return Home();
      case Constants.TRASH:
        return Trash();
      case Constants.SETTINGS:
        return Settings();
      case Constants.HELP:
        return Help();
      case Constants.ABOUT:
        return About();
      case Constants.PRIVACY_POLICY:
        return Settings();
      default:
    }
  }

  Future<bool> _onBackPressed() async {
    if (selectedNavItem != Constants.HOME) {
      setState(() {
        selectedNavItem = Constants.HOME;
      });
      return false;
    }
    return true;
  }

  List<Widget> _createActionWidgets() {
    return [
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
        onTap: () {},
      ),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.sort),
        ),
        onTap: () {},
      )
    ];
  }
}
