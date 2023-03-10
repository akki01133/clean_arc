import 'package:clean_arc/core/api/api_service.dart';
import 'package:clean_arc/features/notes/data/model/note_model.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../core/api/endpoints.dart';

abstract class NotesRemoteDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<void> updateNote(NoteModel model);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> searchNotes(String query, int page);
}

class NotesRemoteDataSourceImpl extends NotesRemoteDataSource{
  final ApiService service;
  NotesRemoteDataSourceImpl({required this.service});

  @override
  Future<void> deleteNote(String id) {
    return service.deleteData(endpoint: "${Endpoints.notes}/$id", converter: (value) => log(value));
  }

  @override
  Future<List<NoteModel>> getAllNotes() async{
    return service.getCollectionData<NoteModel>(endpoint: Endpoints.notes, converter: NoteModel.fromJson);
  }

  @override
  Future<List<NoteModel>> searchNotes(String query, int page) async{
    return service.getCollectionData(endpoint: Endpoints.notes, converter: NoteModel.fromJson, queryParams: {"search":query});
  }
  @override
  Future<void> updateNote(NoteModel model) async{
    return service.updateData<void>(endpoint: Endpoints.notes, data: model.toJson(), converter: (value){log(value);} );
  }

}
