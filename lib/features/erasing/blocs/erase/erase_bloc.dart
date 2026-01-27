import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/const/system_untils.dart';
import '../../../../entities/photo/photo.dart';
import '../../../../services/erase/erase_service.dart';
import '../../../../services/note/model/note.dart';
import '../../../../services/note/note_service.dart';
import '../../../../services/photo/photo_service.dart';

part 'erase_event.dart';
part 'erase_state.dart';

class EraseBloc extends Bloc<EraseEvent, EraseState> {
  EraseBloc({
    required EraseService eraseService,
    required PhotoService photoService,
    required NoteService noteService,
    required this.initialImage,
  }) : _eraseService = eraseService,
       _photoService = photoService,
       _noteService = noteService,
       super(EraseInitial(image: initialImage)) {
    on<PressChangeBg>(onChangeBg);
    on<SetActiveBg>(onSetActiveBg);
    on<PressEraseBg>(onEraseBg);
  }
  final String initialImage;
  final PhotoService _photoService;
  final EraseService _eraseService;
  final NoteService _noteService;

  onResult(PressFinish event, Emitter<EraseState> emit) async {
    await _photoService.savePhoto(Photo.create(path: state.image));
    //TODO open result modal sheet
  }

  onEraseObj(PressEraseObj event, Emitter<EraseState> emit) async {
    try {
      final bytes = await _eraseService.eraseObject(state.image, event.mask);
      final newImage = initialImage == state.image
          ? await _photoService.saveAfterChange(bytes!)
          : state.image;
      emit(EraseInitial(image: newImage));
    } catch (e) {
      dprint(e.toString());
    }
  }

  onChangeBg(PressChangeBg event, Emitter<EraseState> emit) async {
    try {
      if (state case EraseWithBg eraseState) {
        final bg = eraseState.bg;
        emit(EraseBgLoading(image: state.image));
        final bytes = await _eraseService.changeBG(state.image, bg: bg);
        final newImage = await _photoService.saveAfterChange(bytes!);
        emit(EraseInitial(image: newImage));
      }
    } catch (e) {
      dprint(e.toString());
      _noteService.addNote(
        AppNote(title: 'error_title', message: 'error_subtitle'),
      );
    }
  }

  onEraseBg(PressEraseBg event, Emitter<EraseState> emit) {
    emit(EraseInitial(image: initialImage));
  }

  onSetActiveBg(SetActiveBg event, Emitter<EraseState> emit) {
    emit(EraseWithBg(image: state.image, bg: event.bg));
  }
}
