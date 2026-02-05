import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../core/observers/bloc_observer.dart';
import '../../../../entities/photo/photo.dart';
import '../../../../services/erase/erase_service.dart';
import '../../../../services/ui_message/ui_message_service.dart';
import '../../../../services/photo/photo_service.dart';
import '../../../main/blocs/photo/photo_bloc.dart';
import '../../../widgets/pop_up_content/pop_up_error.dart';
import '../../../widgets/pop_up_content/sheet_result.dart';

part 'erase_event.dart';
part 'erase_state.dart';

@injectable
class EraseBloc extends Bloc<EraseEvent, EraseState> {
  EraseBloc({
    required EraseService eraseService,
    required PhotoService photoService,
    required UIMessageService uiMessageService,
    @factoryParam required this.initialPhoto,
  }) : _eraseService = eraseService,
       _photoService = photoService,
       _uiMessageService = uiMessageService,
       super(EraseInitial(image: initialPhoto.photoPath)) {
    on<PressFinishWithChangeBg>(onChangeBg);
    on<SetActiveBg>(onSetActiveBg);
    on<PressEraseBg>(onEraseBg);
    on<PressFinish>(onResult);
    on<PressEraseObj>(onEraseObj);
  }
  late Photo initialPhoto;
  final PhotoService _photoService;
  final EraseService _eraseService;
  final UIMessageService _uiMessageService;
  PhotoBloc? photoBloc;

  onEraseObj(PressEraseObj event, Emitter<EraseState> emit) async {
    try {
      emit(EraseObjLoading(image: state.image));
      final bytes = await _eraseService.eraseObject(state.image, event.mask);
      final newImage = await _photoService.saveAfterChange(bytes);
      emit(EraseWithMask(image: newImage));
    } catch (e, st) {
      emit(EraseInitial(image: state.image));
      handlingError(e, st);
    }
  }

  onChangeBg(PressFinishWithChangeBg event, Emitter<EraseState> emit) async {
    try {
      if (state case final EraseWithBg eraseState) {
        final bg = eraseState.bg;
        emit(EraseBgLoading(image: state.image));
        final bytes = await _eraseService.changeBG(state.image, bg: bg);
        final newImage = await _photoService.saveAfterChange(bytes);
        emit(EraseInitial(image: newImage));
      }
      add(PressFinish());
    } catch (e, st) {
      emit(EraseInitial(image: state.image));
      handlingError(e, st);
    }
  }

  onEraseBg(PressEraseBg event, Emitter<EraseState> emit) {
    emit(EraseInitial(image: initialPhoto.photoPath));
  }

  onSetActiveBg(SetActiveBg event, Emitter<EraseState> emit) {
    emit(EraseWithBg(image: state.image, bg: event.bg));
  }

  onResult(PressFinish event, Emitter<EraseState> emit) async {
    final newPhoto = await _photoService.updatePhoto(initialPhoto, state.image);
    initialPhoto = initialPhoto.copyWith(id: newPhoto.id);
    await Future.delayed(
      const Duration(milliseconds: 200),
    ); //TODO проверить проигрывание анимации загрузки
    if (photoBloc != null) {
      _uiMessageService.showAppSheet(SheetResult.show(newPhoto, photoBloc!));
    }
  }

  void handlingError(Object error, Object stTr) {
    if (error is NetworkException) {
      _uiMessageService.showAppDialog(child: PopupError.showNetworkError());
    }
    handleError(error, stTr);
  }
}
