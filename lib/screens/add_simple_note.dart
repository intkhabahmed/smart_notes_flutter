import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/models/note.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/db_notifier.dart';

class AddSimpleNote extends StatefulWidget {
  @override
  _AddSimpleNoteState createState() => _AddSimpleNoteState();
}

class _AddSimpleNoteState extends State<AddSimpleNote> {
  var _formKey = GlobalKey<FormState>();
  var _titleFieldController = TextEditingController();
  var _descriptionFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.ADD_SIMPLE_NOTE,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              if (_formKey.currentState.validate()) {
                var note = Note();
                note.noteTitle = _titleFieldController.value.text;
                note.description = _descriptionFieldController.value.text;
                note.noteType = Constants.SIMPLE_NOTE;
                note.dateCreated = DateTime.now().millisecondsSinceEpoch;
                Provider.of<DBNotifier>(context).insertNote(note);
                Navigator.of(context).pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _titleFieldController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Enter note title",
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter the title";
                    }
                    return null;
                  },
                  autovalidate: _titleFieldController.value.text.isNotEmpty,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.alarm_add,
                        size: 48.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Click on icon to setup reminder",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _descriptionFieldController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: "Enter note description",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter the description";
                    }
                    return null;
                  },
                  autovalidate:
                      _descriptionFieldController.value.text.isNotEmpty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
