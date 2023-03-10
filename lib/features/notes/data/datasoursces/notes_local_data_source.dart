

import 'package:clean_arc/features/notes/data/datasoursces/db/notebox.dart';
import 'package:clean_arc/features/notes/data/model/note_table.dart';

import '../../../../core/object_box.dart';
import '../model/note_model.dart';

abstract class NotesLocalDataSource{
  Future<List<NoteTable>> getCachedNotes();
  Future<NoteTable?> getNoteById(int id);
  Future<void> cacheAllNotes(List<NoteTable> notes);
  /// add any method that is only for this device
  /// like bookmark feature which is not synced with the remote database but is only for this mobile user
  // Future<String> insertBookmarkNote(NoteTable note);
}

class NotesLocalDataSourceImpl extends NotesLocalDataSource{
  final ObjectBox objectbox;

  NotesLocalDataSourceImpl(
      this.objectbox
  );

  @override
  Future<void> cacheAllNotes(List<NoteTable> notes) async {
    // call the objectbox methods here
    objectbox.cacheAllNotes(notes);
  }

  @override
  Future<NoteTable?> getNoteById(int id) async{
    return objectbox.getNoteById(id);
  }

  @override
  Future<List<NoteTable>> getCachedNotes() async {
    return objectbox.getCachedNotes();
  }

}
