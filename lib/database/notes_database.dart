import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartnotes/models/note.dart';
import 'package:smartnotes/utils/constants.dart';
import 'package:sqflite/sqflite.dart';

class NotesDBProvider {
  static final NotesDBProvider instance = NotesDBProvider._();
  static Database _database;
  NotesDBProvider._();

  Future<Database> get db async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, Constants.DB_NAME);
    return await openDatabase(path,
        version: 1, onCreate: _onDBCreate, onUpgrade: _onDBUpgrade);
  }

  Future<void> _onDBCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS `${Constants.TABLE_NAME}` (`_ID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        `title` TEXT, `description` TEXT, `noteType` TEXT, `dateCreated` INTEGER NOT NULL, `dateModified` INTEGER NOT NULL, 
        `trash` INTEGER NOT NULL, `remainingTimeToRemind` INTEGER NOT NULL, `reminderDateTime` TEXT)''');
  }

  Future<void> _onDBUpgrade(Database db, int oldVersion, int newVersion) async {
    //logic for upgrading database
  }

  //DAO methods
  Future<List<Note>> getNotesByTypeAndAvailabilty(
      String type, int trashed, String sortOrder) async {
    var db = await NotesDBProvider.instance.db;
    var res = await db.query(Constants.TABLE_NAME,
        where: "noteType = ? AND trash = ?",
        whereArgs: [type, trashed],
        orderBy: "$sortOrder");
    return res.isNotEmpty
        ? res.map((note) => Note.fromJson(note)).toList()
        : [];
  }

  Future<List<Note>> getNotesByAvailabilty(int trashed) async {
    var db = await NotesDBProvider.instance.db;
    var res = await db.query(Constants.TABLE_NAME,
        where: "trash = ?", whereArgs: [trashed], orderBy: "dateUpdated DESC");
    return res.isNotEmpty
        ? res.map((note) => Note.fromJson(note)).toList()
        : [];
  }

  Future<int> insertNote(Note note) async {
    var db = await NotesDBProvider.instance.db;
    return await db.insert(Constants.TABLE_NAME, note.toJson());
  }

  Future<int> updateNote(Note note) async {
    var db = await NotesDBProvider.instance.db;
    return await db.update(Constants.TABLE_NAME, note.toJson(),
        where: "_ID = ?", whereArgs: [note.noteId]);
  }

  Future<int> moveToTrash(int noteId) async {
    var db = await NotesDBProvider.instance.db;
    return await db.rawUpdate(
        "UPDATE ${Constants.TABLE_NAME} SET trash = ? WHERE _ID = ?",
        [1, noteId]);
  }

  Future<int> restoreFromTrash(int noteId) async {
    var db = await NotesDBProvider.instance.db;
    return await db.rawUpdate(
        "UPDATE ${Constants.TABLE_NAME} SET trash = ? WHERE _ID = ?",
        [0, noteId]);
  }

  Future<int> emptyTrash() async {
    var db = await NotesDBProvider.instance.db;
    return await db
        .delete(Constants.TABLE_NAME, where: "trash = ?", whereArgs: [1]);
  }

  Future<int> deleteNote(int noteId) async {
    var db = await NotesDBProvider.instance.db;
    return await db
        .delete(Constants.TABLE_NAME, where: "_ID = ?", whereArgs: [noteId]);
  }

  Future<List<Note>> searchNotesByTitle(String title) async {
    var db = await NotesDBProvider.instance.db;
    return await db.query(Constants.TABLE_NAME,
        where: "title LIKE % ? %",
        whereArgs: [
          title
        ]).then((it) => it.map((note) => Note.fromJson(note)).toList());
  }
}
