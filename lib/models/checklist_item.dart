import 'package:flutter/foundation.dart';

class ChecklistItem {
  String title;
  bool isChecked;

  ChecklistItem({@required this.title, @required this.isChecked});

  ChecklistItem.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        isChecked = map['isChecked'];

  Map<String, dynamic> toJson() => {'title': title, 'isChecked': isChecked};
}
