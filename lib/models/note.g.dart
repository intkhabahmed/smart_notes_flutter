// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note()
    ..noteId = json['_ID'] as int
    ..noteTitle = json['title'] as String
    ..description = json['description'] as String
    ..noteType = json['noteType'] as String
    ..dateCreated = json['dateCreated'] as int
    ..dateModified = json['dateModified'] as int
    ..trashed = json['trash'] as int
    ..remainingTimeToRemind = json['remainingTimeToRemind'] as int
    ..reminderDateTime = json['reminderDateTime'] as String;
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      '_ID': instance.noteId,
      'title': instance.noteTitle,
      'description': instance.description,
      'noteType': instance.noteType,
      'dateCreated': instance.dateCreated,
      'dateModified': instance.dateModified,
      'trash': instance.trashed,
      'remainingTimeToRemind': instance.remainingTimeToRemind,
      'reminderDateTime': instance.reminderDateTime
    };
