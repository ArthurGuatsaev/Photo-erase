import 'package:bloc/bloc.dart';
import 'package:erasica/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/router/router.gr.dart';
import '../../../entities/photo/photo.dart';
import '../../../services/erase/erase_service.dart';
import '../../../services/note/model/note.dart';
import '../../../services/note/note_service.dart';
import '../../../services/photo/photo_service.dart';

part 'main_event.dart';
part 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required PhotoService photoService,
    required NoteService noteService,
    required EraseService eraseService,
  }) : _photoService = photoService,
       _noteService = noteService,
       _eraseService = eraseService,
       super(MainInitial()) {
    on<PressEraseObject>(onEraseObject);
    on<HandleMainState>(onChangeState);
    on<PressEraseBg>(onEraseBg);

    _photoService.watchPhotos().listen(
      (photos) => add(HandleMainState(photos: photos)),
    );
  }
  final NoteService _noteService;
  final PhotoService _photoService;
  final EraseService _eraseService;

  onChangeState(HandleMainState event, Emitter<MainState> emit) {
    event.photos.isEmpty
        ? emit(MainInitial())
        : emit(MainWithHistory(photos: event.photos));
  }

  onEraseObject(PressEraseObject event, Emitter<MainState> emit) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final photo = Photo.create(path: image!.path);
      appRouter.push(EraseObjRoute(photo: photo));
    } catch (error, stackTrace) {
      _noteService.addNote(AppNote(title: 'error', message: 'stackTrace'));
    }
  }

  onEraseBg(PressEraseBg event, Emitter<MainState> emit) async {
    try {
      emit(MainLoadingBg(photos: state.photos));
      final imagePath = await _photoService.pickImage();
      await _eraseService.removeBg(imagePath);
      final photo = Photo.create(path: imagePath);
      appRouter.push(EraseBgRoute(photo: photo));
    } catch (error, stackTrace) {
      // _noteService.addError(EraseError(error: error, stackTrace: stackTrace));
    } finally {
      add(HandleMainState(photos: state.photos));
    }
  }
}
