import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/db_notifier.dart';
import 'package:smartnotes/widgets/text_note_item.dart';

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DBNotifier>(
      builder: (context, dbNotifier, child) {
        dbNotifier.setNotesByType(type: Constants.CHECKLIST, trash: 0);
        var notes = dbNotifier.getNotesByType(Constants.CHECKLIST);
        return notes.isNotEmpty
            ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) => TextNoteItem(notes[index]),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.note_add,
                      size: 56.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "No notes to show. Kindly tap '+' button to add",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
