import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:erasica/main.dart';
import 'package:meta/meta.dart';

import '../../../services/photo/photo_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required PhotoService photoService})
    : _photoService = photoService,
      super(HistoryInitial(photos: [])) {
    on<PressSelect>(onPressSelect);
    on<PressSelectItem>(onPressItem);
    on<PressSelectAll>(onPressSelectAll);
    on<PressDeselectAll>(onPressDeselectAll);
    on<PressCancelSelect>(onPressCancelSelect);

    _photoService.watchPhotos().listen(
      (photos) => add(GetHistoryPhotos(photos: photos)),
    );
  }

  final PhotoService _photoService;

  onGetPhotos(GetHistoryPhotos event, Emitter<HistoryState> emit) {
    if (event.photos.isEmpty) appRouter.maybePop();
    emit(HistoryInitial(photos: event.photos));
  }

  onPressSelect(PressSelect event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(photos: state.photos));
  }

  onPressItem(PressSelectItem event, Emitter<HistoryState> emit) {
    if (state case HistorySelecting selState) {
      final selected = {...selState.selected}..selection(event.id);
      emit(HistorySelecting(selected: selected, photos: state.photos));
    }
  }

  onPressSelectAll(PressSelectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelectAll(photos: state.photos));
  }

  onPressDeselectAll(PressDeselectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(selected: <String>{}, photos: state.photos));
  }

  onPressCancelSelect(PressCancelSelect event, Emitter<HistoryState> emit) {
    emit(HistoryInitial(photos: state.photos));
  }

  onPressDeleteSelected(PressDeletes event, Emitter<HistoryState> emit) async {
    if (state case HistorySelecting selState) {
      await _photoService
          .deletePhotos(selState.selected.toList())
          .onError(handleError);
    }
  }

  onPressDeleteOne(PressDeleteOne event, Emitter<HistoryState> emit) async {
    await _photoService.deletePhoto(event.id).onError(handleError);
  }

  handleError(Object error, Object stTr) {
    dprint(error.toString());
  }
}
