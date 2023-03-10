
import 'package:clean_arc/features/notes/domain/entities/note.dart';
import 'package:equatable/equatable.dart';

class NoteModel extends Equatable{
  final String id;
  final String title;
  final String note;

  NoteModel({required this.id,required this.title, required this.note});

  factory NoteModel.fromJson(Map<String, dynamic> value) {
    return NoteModel(id:value['id'],title: value['title'], note: value['note']);
  }

  Map<String,dynamic> toJson()=>{
    "id":title,
    "title":title,
    "note": note,
  };

  Note toEntity() => Note(netId: id,title: title, note: note);

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [title,note];



}
