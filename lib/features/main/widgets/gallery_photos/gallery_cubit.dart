import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/const/system_untils.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../entities/photo/photo.dart';
import '../../../../services/app/app_service.dart';
import '../../../../services/gallery_photos/gallery_photo_service.dart';
import '../../../../services/photo/photo_service.dart';
import '../../../../services/ui_message/ui_message_service.dart';
import '../../../widgets/pop_up_content/pop_up_error.dart';
import '../../../widgets/pop_up_content/sheet_erase.dart';
import '../../blocs/photo/photo_bloc.dart';

part 'gallery_state.dart';

@LazySingleton()
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({
    required GalleryPhotoService galleryService,
    required UIMessageService uiMessageService,
    required PhotoService photoService,
    required AppService appService,
  }) : _galleryPhotoService = galleryService,
       _uiMessageService = uiMessageService,
       _photoService = photoService,
       _appService = appService,
       super(GalleryAllowInitial()) {
    _subscription = _galleryPhotoService.watchGalleryPhotos().listen(
      (photos) => photos.isEmpty
          ? emit(GalleryAllowInitial())
          : emit(GalleryWithPhotos(galleryPhotos: photos)),
    );
  }

  StreamSubscription<List<String>>? _subscription;
  final GalleryPhotoService _galleryPhotoService;
  final PhotoService _photoService;
  final AppService _appService;
  final UIMessageService _uiMessageService;

  Future<void> onLoad() async {
    await _galleryPhotoService.loadGalleryPhotos().onError(handlingError);
  }

  Future<void> onPressAllow() async {
    emit(GalleryLoading());
    await _galleryPhotoService.openGallery().onError(handlingError);
  }

  Future<void> pickImage(String path, PhotoBloc bloc) async {
    final photo = await _photoService.savePhoto(Photo.create(path: path));
    _uiMessageService.showAppSheet(SheetErase.show(bloc, photo));
  }

  void handlingError(Object error, Object stTr) {
    emit(GalleryNoAccess());
    if (error is PermissionException) {
      _uiMessageService.showAppDialog(
        child: PopupError.showPermissionError(() => _appService.openSettings()),
      );
    }
    dprint(error.toString() + stTr.toString());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
