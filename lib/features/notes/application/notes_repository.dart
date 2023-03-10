

import 'package:clean_arc/exceptions/failure.dart';
import 'package:clean_arc/features/notes/domain/entities/note.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepository{
  Future<Either<Failure, List<Note>>> getAllNotes();
  // Future<bool> isNoteArchived();
  // Future<Either<Failure, List<Note>>> getArchivedNotes();
  Future<Either<Failure, String>> deleteNote(String id);
  Future<Either<Failure, String>> updateNote(String id);
}
