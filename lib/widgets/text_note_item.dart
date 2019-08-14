import 'package:flutter/material.dart';
import 'package:smartnotes/models/note.dart';
import 'package:timeago/timeago.dart' as timeago;

class TextNoteItem extends StatelessWidget {
  final Note note;

  TextNoteItem(this.note);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    note.noteTitle,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    note.description,
                    style: Theme.of(context).textTheme.subtitle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              trailing: Text(
                timeago.format(
                    DateTime.fromMillisecondsSinceEpoch(note.dateCreated),
                    allowFromNow: true),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.black38,
              indent: 16.0,
              endIndent: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
