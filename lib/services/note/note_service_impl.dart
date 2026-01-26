import 'dart:async';

import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/features/widgets/pop_up_content/error_pop_up.dart';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'model/note.dart';
import 'note_service.dart';

@LazySingleton(as: NoteService)
class NoteServiceImpl implements NoteService {
  final StreamController<AppNote> _notes;
  BuildContext get context => appRouter.navigatorKey.currentContext!;
  NoteServiceImpl() : _notes = StreamController<AppNote>.broadcast() {
    watchNote.listen((data) {
      dprint(data);
      showDialog(
        context: context,
        builder: (_) => ErrorPopup(subtitle: 'subtitle', title: 'title'),
      );
    });
  }

  @override
  Stream<AppNote> get watchNote => _notes.stream;

  @override
  void addNote(AppNote note) => _notes.add(note);

  @override
  Future<void> dispose() async {
    await Future.wait([_notes.close()]);
  }
}
