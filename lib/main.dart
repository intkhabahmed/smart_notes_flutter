import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Smart Notes'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedNavItem = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
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
                setState(() {
                  selectedNavItem = "Home";
                });
                Navigator.pop(context);
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
                setState(() {
                  selectedNavItem = "Trash";
                });
                Navigator.pop(context);
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
                setState(() {
                  selectedNavItem = "Settings";
                });
                Navigator.pop(context);
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
                setState(() {
                  selectedNavItem = "Help";
                });
                Navigator.pop(context);
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
                setState(() {
                  selectedNavItem = "About";
                });
                Navigator.pop(context);
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
                setState(() {
                  selectedNavItem = "Privacy Policy";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
