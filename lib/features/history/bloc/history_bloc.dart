import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:meta/meta.dart';
import '../../../core/observers/bloc_observer.dart';
import '../../../entities/photo/photo.dart';
import '../../../services/photo/photo_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required PhotoService photoService})
    : _photoService = photoService,
      super(HistoryInitial()) {
    on<PressSelect>(onPressSelect);
    on<PressSelectItem>(onPressItem);
    on<PressSelectAll>(onPressSelectAll);
    on<PressDeselectAll>(onPressDeselectAll);
    on<PressCancelSelect>(onPressCancelSelect);
  }
  final PhotoService _photoService;

  onPressSelect(PressSelect event, Emitter<HistoryState> emit) {
    emit(HistorySelecting());
  }

  onPressSelectAll(PressSelectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelectAll(selected: event.ids));
  }

  onPressDeselectAll(PressDeselectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(selected: <String>{}));
  }

  onPressCancelSelect(PressCancelSelect event, Emitter<HistoryState> emit) {
    emit(HistoryInitial());
  }

  onPressDeleteOne(PressDeleteOne event, Emitter<HistoryState> emit) async {
    await _photoService.deletePhoto(event.id).onError(handleError);
  }

  onPressDeleteSelected(PressDeletes event, Emitter<HistoryState> emit) async {
    if (state is HistorySelecting || state is HistorySelectAll) {
      await _photoService
          .deletePhotos(state.selected.toList())
          .onError(handleError);
    }
  }

  onPressItem(PressSelectItem event, Emitter<HistoryState> emit) {
    if (state is HistorySelecting || state is HistorySelectAll) {
      final selected = {...state.selected}..selection(event.id);
      emit(HistorySelecting(selected: selected));
    }
  }
}
