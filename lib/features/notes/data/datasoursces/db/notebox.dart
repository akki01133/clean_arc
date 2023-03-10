import 'package:clean_arc/core/object_box.dart';
import '../../model/note_table.dart';

/// object box store and functions import objectbox and inject the functionalities here
extension NoteBox on ObjectBox{
  List<NoteTable> getCachedNotes() => noteBox.getAll();
  NoteTable? getNoteById(int id) => noteBox.get(id);
  void cacheAllNotes(List<NoteTable> notes) => noteBox.putMany(notes);
  // update
  // delete
}
