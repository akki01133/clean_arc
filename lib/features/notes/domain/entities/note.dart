import 'package:equatable/equatable.dart';


/// immutable class
/// should have all properties final
/// to mutate the properties ex. update the note --> add extension over this class to update and return a new note
class Note extends Equatable{
  final String netId;
  final String title;
  final String note;

  Note({required this.netId,required this.title, required this.note});

  @override
  List<Object?> get props => [note];

}

extension MutableNote on Note{
  Note updateNote(String note, ){
    return Note(netId: netId,title:title,note: note);
  }

  Note updateTitle(String title){
    return Note(netId: netId,title: title, note: note);
  }

}
