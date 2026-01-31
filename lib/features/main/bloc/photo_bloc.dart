import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:erasica/main.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/observers/bloc_observer.dart';
import '../../../core/router/router.gr.dart';
import '../../../entities/photo/photo.dart';
import '../../../services/erase/erase_service.dart';
import '../../../services/ui_message/ui_message_service.dart';
import '../../../services/payments/payment_service.dart';
import '../../../services/photo/photo_service.dart';
import '../../widgets/pop_up_content/pop_up_error.dart';
import '../../widgets/pop_up_content/sheet_removing_buttons.dart';

part 'photo_event.dart';
part 'photo_state.dart';

@injectable
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc({
    required PhotoService photoService,
    required UIMessageService uiMessageService,
    required EraseService eraseService,
    required PaymentService paymentService,
  }) : _photoService = photoService,
       _uiMessageService = uiMessageService,
       _eraseService = eraseService,
       _paymentService = paymentService,
       super(PhotoInitial()) {
    on<PickEraseObject>(onPickEraseObject);
    on<HandlePhotoState>(onChangeState);
    on<PickEraseBg>(onPickEraseBg);
    on<PressSharePhotos>(onSharePhotos);
    on<PressEditPhoto>(onEditPhoto);
    on<PressDeletePhoto>(onDeletePhoto);

    _subscription = _photoService.watchPhotos().listen(
      (photos) => add(HandlePhotoState(photos: photos)),
    );
  }

  StreamSubscription<List<Photo>>? _subscription;
  final UIMessageService _uiMessageService;
  final PhotoService _photoService;
  final EraseService _eraseService;
  final PaymentService _paymentService;

  onChangeState(HandlePhotoState event, Emitter<PhotoState> emit) {
    event.photos.isEmpty
        ? emit(PhotoInitial())
        : emit(PhotoWithHistory(photos: event.photos));
  }

  onPickEraseObject(PickEraseObject event, Emitter<PhotoState> emit) async {
    try {
      emit(PhotoLoading(photos: state.photos, loading: LoadType.base));
      final photo = event.photo ?? await _photoService.pickImage();
      appRouter.push(EraseObjRoute(photo: photo));
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
    } finally {
      add(HandlePhotoState(photos: state.photos));
    }
  }

  onPickEraseBg(PickEraseBg event, Emitter<PhotoState> emit) async {
    try {
      emit(PhotoLoading(photos: state.photos, loading: LoadType.erasing));
      final photo = event.photo ?? await _photoService.pickImage();
      await _eraseService.eraseBg(photo.photoPath).onError(handlingError);
      appRouter.push(EraseBgRoute(photo: photo));
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
    } finally {
      add(HandlePhotoState(photos: state.photos));
    }
  }

  onSharePhotos(PressSharePhotos event, Emitter<PhotoState> emit) async {
    if (!_paymentService.state.isPremium) {
      await appRouter.push(PaywallRoute(photo: event.photos.first));
      if (!_paymentService.state.isPremium) return;
    }
    emit(PhotoLoading(loading: LoadType.base, photos: state.photos));
    await _photoService
        .sharePhotos(event.photos, event.render)
        .onError(handlingError);
    add(HandlePhotoState(photos: state.photos));
  }

  onDeletePhoto(PressDeletePhoto event, Emitter<PhotoState> emit) async {
    appRouter.maybePop();
    await _photoService.deletePhoto(event.photo.id).onError(handlingError);
    appRouter.replaceAll([MainRoute()]);
  }

  onEditPhoto(PressEditPhoto event, Emitter<PhotoState> emit) async {
    if (!appRouter.current.name.contains('Erase')) {
      _uiMessageService.showAppSheet(
        SheetRemovingButtons.show(this, event.photo),
      );
    }
  }

  void handlingError(Object error, Object stTr) {
    _uiMessageService.showAppDialog(child: PopupError.showNetworkError());
    handleError(error, stTr);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
