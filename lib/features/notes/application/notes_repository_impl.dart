// implementation of notes repository from domain
import 'package:clean_arc/exceptions/failure.dart';
import 'package:clean_arc/features/notes/data/datasoursces/notes_local_data_source.dart';
import 'package:clean_arc/features/notes/domain/entities/note.dart';
import 'package:clean_arc/features/notes/application/notes_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/network_info.dart';
import '../../../exceptions/exceptions.dart';
import '../data/datasoursces/notes_remote_data_source.dart';
import '../data/model/note_table.dart';

class NotesRepositoryImpl extends NotesRepository{
  final NotesRemoteDataSource remoteDataSource;
  final NotesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  NotesRepositoryImpl({required this.remoteDataSource, required this.localDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async{
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getAllNotes();
        localDataSource.cacheAllNotes(
          result.map((note) => NoteTable.fromDTO(note)).toList(),);
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure(''));
      } on Exception catch (e) {
        /// todo - handle error here
        return Left(CommonFailure(e.toString()));
      }
    } else {
      try {
        final result = await localDataSource.getCachedNotes();
        return Right(result.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, String>> deleteNote(String id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateNote(String id) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }



}
