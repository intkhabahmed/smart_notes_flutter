import 'package:flutter/material.dart';
import 'package:smartnotes/utils/Constanta.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var currentPage = 0;
  var _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: [
                  Tab(
                    text: Constants.SIMPLE_NOTE,
                  ),
                  Tab(
                    text: Constants.CHECKLIST,
                  ),
                  Tab(
                    text: Constants.IMAGE_NOTE,
                  ),
                ],
              )
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
      onWillPop: _onBackPressed,
    );
  }

  Future<bool> _onBackPressed() async {
    if (_tabController.index != 0) {
      _tabController.animateTo(0);
      return false;
    } else {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
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
        ),
      );
    }
  }
}
