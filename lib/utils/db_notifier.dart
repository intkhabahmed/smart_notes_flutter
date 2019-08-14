import 'package:flutter/material.dart';
import 'package:smartnotes/database/notes_database.dart';
import 'package:smartnotes/models/note.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:smartnotes/utils/shared_pref.dart';

class DBNotifier with ChangeNotifier {
  List<Note> simpleNotes = [];
  List<Note> checklists = [];
  List<Note> imageNotes = [];
  List<Note> allNotes = [];

  List<Note> getNotesByType(String type) {
    switch (type) {
      case Constants.SIMPLE_NOTE:
        return simpleNotes;
      case Constants.CHECKLIST:
        return checklists;
      case Constants.IMAGE_NOTE:
        return imageNotes;
      default:
        return null;
    }
  }

  setNotesByType({String type, int trash}) async {
    var sortOrder = await SharedPrefUtils.getF(Constants.SORT_CRITERIA) ??
        Constants.COLUMN_DATE_CREATED_DESC;
    if (type.isNotEmpty) {
      switch (type) {
        case Constants.SIMPLE_NOTE:
          simpleNotes = await NotesDBProvider.instance
              .getNotesByTypeAndAvailabilty(type, trash, sortOrder);
          break;
        case Constants.CHECKLIST:
          checklists = await NotesDBProvider.instance
              .getNotesByTypeAndAvailabilty(type, trash, sortOrder);
          break;
        case Constants.IMAGE_NOTE:
          imageNotes = await NotesDBProvider.instance
              .getNotesByTypeAndAvailabilty(type, trash, sortOrder);
          break;
        default:
      }
    } else {
      allNotes = await NotesDBProvider.instance.getNotesByAvailabilty(trash);
    }
    notifyListeners();
  }

  insertNote(Note note) {
    NotesDBProvider.instance.insertNote(note).then((id) {
      if (id > 0) {
        setNotesByType(type: note.noteType, trash: note.trashed);
      }
    });
  }

  moveToTrash(Note note) {
    NotesDBProvider.instance.moveToTrash(note.noteId).then((trashedRows) {
      if (trashedRows > 0) {
        setNotesByType(type: note.noteType, trash: note.trashed);
      }
    });
  }

  restoreFromTrash(Note note) {
    NotesDBProvider.instance
        .restoreFromTrash(note.noteId)
        .then((recoveredRows) {
      if (recoveredRows > 0) {
        setNotesByType(type: note.noteType, trash: note.trashed);
      }
    });
  }

  updateNote(Note note) {
    NotesDBProvider.instance.updateNote(note).then((updatedRows) {
      if (updatedRows > 0) {
        setNotesByType(type: note.noteType, trash: note.trashed);
      }
    });
  }

  emptyTrash() {
    NotesDBProvider.instance.emptyTrash().then((updatedRows) {
      if (updatedRows > 0) {
        setNotesByType(trash: 1);
      }
    });
  }
}
