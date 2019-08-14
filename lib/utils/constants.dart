class Constants {
  static const String APP_NAME = "Smart Notes";
  static const String SIMPLE_NOTE = "Simple Note";
  static const String CHECKLIST = "Checklist";
  static const String IMAGE_NOTE = "Image Note";
  static const String HOME = "Home";
  static const String TRASH = "Trash";
  static const String SETTINGS = "Settings";
  static const String HELP = "Help";
  static const String ABOUT = "About";
  static const String PRIVACY_POLICY = "Privacy Policy";
  static const String DARK_MODE = "Dark Mode";
  static const String APP_DESCRIPTION =
      "Smart Notes is a simple and awesome notepad app. It gives you a quick and " +
          "simple notepad editing experience when you write notes, shopping lists, " +
          "to-do lists and image notes. Makingnotes in this app is very easy.";
  static const String APP_FEATURES =
      "Features: \n\nThe main features of this app are:\n\n" +
          "1. Makes simple text note in just two clicks \n\n" +
          "2. Take Pictures and save as a note \n\n" +
          "3. Makes checklist notes for To-do list &amp; Shopping list. \n\n" +
          "4. Notification reminder for the notes \n\n" +
          "5. Search notes by Title \n\n" +
          "6. Easy share notes via SMS, E-mail, Twitter or any other platform \n\n" +
          "7. Sticky note memo widget (Put your notes on your home screen)";
  static const String ADD_SIMPLE_NOTE = "Add Simple Note";

  //database constants
  static const String DB_NAME = "smartNotes.db";
  static const String TABLE_NAME = "notes";
  static const String SORT_CRITERIA = "Sort Criteria";
  static const String SORT_CRITERIA_ID = "Sort Id";
  static const int SORT_CRITERIA_ID_DEFAULT = 4;
  static const String COLUMN_DATE_CREATED_ASC = "dateCreated ASC";
  static const String COLUMN_DATE_CREATED_DESC = "dateCreated DESC";
  static const String COLUMN_TITLE_ASC = "title ASC";
  static const String COLUMN_TITLE_DESC = "title DESC";
  static const String ASC = "ASC";

  //Notification constants
  static const String NOTE_REMINDER_TASK = "note_reminder_task";
  static const String NOTIFICATION_CHANNEL_ID = "reminder_notification_channel";
  static const String NOTIFICATION_CHANNEL_NAME = "Reminder Notifications";
  static const String NOTIFICATION_INTENT_EXTRA = "notification_intent_extra";
  static const String NOTE_EXTRA = "job_note_extra";
  static const String PREF = "pref_";
  static const int WIDGET_IMAGE_SIZE = 1000;
}
