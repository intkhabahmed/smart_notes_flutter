import 'package:flutter/material.dart';
import 'package:smartnotes/fragments/about.dart';
import 'package:smartnotes/fragments/help.dart';
import 'package:smartnotes/fragments/home.dart';
import 'package:smartnotes/fragments/settings.dart';
import 'package:smartnotes/fragments/trash.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/shared_pref.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedNavItem = Constants.HOME;

  @override
  void initState() {
    SharedPrefUtils.init();
    super.initState();
  }

  @override
  void dispose() {
    SharedPrefUtils.dispose();
    super.dispose();
  }

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
      ),
    );
  }

  _makeDrawer() {
    return Drawer(
      child: Column(
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
          _buildDrawerItem(Icons.home, Constants.HOME),
          _buildDrawerItem(Icons.delete, Constants.TRASH),
          _buildDrawerItem(Icons.settings, Constants.SETTINGS),
          _buildDrawerItem(Icons.help, Constants.HELP),
          _buildDrawerItem(Icons.info, Constants.ABOUT),
          _buildDrawerItem(Icons.security, Constants.PRIVACY_POLICY),
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

  _buildDrawerItem(IconData iconData, String itemName) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        itemName,
        style: TextStyle(fontSize: 18.0),
      ),
      selected: selectedNavItem == itemName,
      onTap: () {
        Navigator.pop(context);
        setState(() {
          selectedNavItem = itemName;
        });
      },
    );
  }
}
