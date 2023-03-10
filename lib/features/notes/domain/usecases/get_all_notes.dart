import 'package:clean_arc/features/notes/application/notes_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../exceptions/failure.dart';
import '../entities/note.dart';

class GetAllNotes {
  final NotesRepository repository;
  GetAllNotes(this.repository);

  /// the call function can have the params that are required by the repository method
  /// generally it is done by extending the usecase class and pass the Param type as a class created in this usecase file
  /// to hold the data of all the parameters required by respective repository method
  Future<Either<Failure, List<Note>>> call() async{
    return await repository.getAllNotes();
  }
}
