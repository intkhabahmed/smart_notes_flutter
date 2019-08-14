import 'package:flutter/material.dart';
import 'package:smartnotes/fragments/checklist.dart';
import 'package:smartnotes/fragments/image_note.dart';
import 'package:smartnotes/fragments/simple_note.dart';
import 'package:smartnotes/screens/add_simple_note.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/helper_widgets.dart';

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
                SimpleNote(),
                CheckList(),
                ImageNote(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              switch (currentPage) {
                case 0:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddSimpleNote()));
                  break;
                default:
              }
            },
            tooltip: 'Add',
            child: Icon(Icons.add),
          )),
      onWillPop: _onBackPressed,
    );
  }

  Future<bool> _onBackPressed() async {
    if (_tabController.index != 0) {
      _tabController.animateTo(0);
      return false;
    }
    return showDialog(
      context: context,
      builder: (context) => HelperWidgets.getAlertDialog(context),
    );
  }
}
