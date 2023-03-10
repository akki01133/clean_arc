// the database stored model
// ignore if the data's are same as note_model or note_entity but is preferred to have separate class for database
import 'package:clean_arc/features/notes/domain/entities/note.dart';
import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

import 'note_model.dart';

@Entity()
class NoteTable{
  int id;
  final String netId;
  final String title;
  final String note;

  NoteTable({this.id = 0,required this.netId,required this.title, required this.note});

  factory NoteTable.fromJson(Map<String, dynamic> value) {
    return NoteTable(netId: value['netId'],title: value['title'], note: value['note']);
  }

  factory NoteTable.fromEntity(Note note){
    return NoteTable(netId: note.netId,title: note.title, note: note.note);
  }

  factory NoteTable.fromDTO(NoteModel note){
    return NoteTable(netId: note.id,title: note.title, note: note.note);
  }

  Note toEntity() => Note(netId:netId, title: title, note: note);


  Map<String,dynamic> toJson()=>{
    "netId": netId,
    "title":title,
    "note": note,
  };

  @override
  String toString() {
    return toJson().toString();
  }




}
