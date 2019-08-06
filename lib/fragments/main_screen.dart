import 'package:flutter/material.dart';
import 'package:smartnotes/fragments/home.dart';
import 'package:smartnotes/fragments/trash.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedNavItem = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: selectedNavItem == "Home" ? 0.0 : AppBar().elevation,
      ),
      drawer: makeDrawer(),
      body: openNavItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  makeDrawer() {
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
                Text("Home"),
              ],
            ),
            selected: selectedNavItem == "Home",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "Home";
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
                Text("Trash"),
              ],
            ),
            selected: selectedNavItem == "Trash",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "Trash";
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
                Text("Settings"),
              ],
            ),
            selected: selectedNavItem == "Settings",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "Settings";
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
                Text("Help"),
              ],
            ),
            selected: selectedNavItem == "Help",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "Help";
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
                Text("About"),
              ],
            ),
            selected: selectedNavItem == "About",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "About";
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
                Text("Privacy Policy"),
              ],
            ),
            selected: selectedNavItem == "Privacy Policy",
            onTap: () {
              Navigator.pop(context);
              setState(() {
                selectedNavItem = "Privacy Policy";
              });
            },
          ),
        ],
      ),
    );
  }

  openNavItem() {
    switch (selectedNavItem) {
      case "Home":
        return Home();
      case "Trash":
        return Trash();
      default:
    }
  }
}
