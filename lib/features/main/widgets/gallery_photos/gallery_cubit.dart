import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erasica/features/main/bloc/photo_bloc.dart';
import 'package:erasica/features/widgets/pop_up_content/pop_up_error.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/const/system_untils.dart';
import '../../../../entities/photo/photo.dart';
import '../../../../services/gallery_photos/gallery_photo_service.dart';
import '../../../../services/photo/photo_service.dart';
import '../../../../services/ui_message/ui_message_service.dart';
import '../../../widgets/pop_up_content/sheet_removing_buttons.dart';

part 'gallery_state.dart';

@LazySingleton()
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({
    required GalleryPhotoService galleryService,
    required UIMessageService uiMessageService,
    required PhotoService photoService,
  }) : _galleryPhotoService = galleryService,
       _uiMessageService = uiMessageService,
       _photoService = photoService,
       super(GalleryAllowInitial()) {
    _subscription = _galleryPhotoService.watchGalleryPhotos().listen(onHandle);
  }
  StreamSubscription<List<String>>? _subscription;
  final GalleryPhotoService _galleryPhotoService;
  final PhotoService _photoService;
  final UIMessageService _uiMessageService;
  Future<void> onLoad() async {
    await _galleryPhotoService.loadGalleryPhotos().onError(handlingError);
  }

  Future<void> onPressAllow() async {
    await _galleryPhotoService.openGallery().onError(handlingError);
  }

  void onHandle(List<String> photos) {
    if (photos.isNotEmpty) {
      emit(GalleryWithPhotos(galleryPhotos: photos));
    }
    if (photos.isEmpty) {
      emit(GalleryAllowInitial());
    }
  }

  void handlingError(Object error, Object stTr) {
    emit(GalleryNoAccess());
    _uiMessageService.showAppDialog(
      child: PopupError.showPermissionError(goToSettings),
    );
    dprint(error.toString() + stTr.toString());
  }

  void goToSettings() {
    try {
      launchUrlString('app-settings:');
    } catch (e) {
      dprint('launchUrl error: $e');
    }
  }

  Future<void> pickImage(String path, PhotoBloc bloc) async {
    final photo = await _photoService.savePhoto(Photo.create(path: path));
    _uiMessageService.showAppSheet(SheetRemovingButtons.show(bloc, photo));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
