import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  @JsonKey(name: '_ID')
  int noteId;
  @JsonKey(name: 'title')
  String noteTitle;
  String description;
  String noteType;
  int dateCreated;
  int dateModified = 0;
  @JsonKey(name: 'trash')
  int trashed = 0;
  int remainingTimeToRemind = 0;
  String reminderDateTime = "";

  Note();

  factory Note.fromJson(Map<String, dynamic> map) => _$NoteFromJson(map);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
