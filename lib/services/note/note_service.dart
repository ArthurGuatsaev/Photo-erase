import 'dart:async';
import 'model/note.dart';

abstract class NoteService {
  Stream<AppNote> get watchNote;
  Future<void> dispose();

  void addNote(AppNote note);
}
