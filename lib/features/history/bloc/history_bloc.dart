import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:meta/meta.dart';

import '../../../services/photo/photo_service.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required PhotoService photoService})
    : _photoService = photoService,
      super(HistoryInitial(photos: [])) {
    on<PressSelect>(onPressSelect);
    on<PressHistoryItem>(onPressItem);
    on<PressSelectAll>(onPressSelectAll);
    on<PressDeselectAll>(onPressDeselectAll);
    on<PressCancelSelect>(onPressCancelSelect);

    _photoService.watchPhotos().listen(
      (photos) => add(GetHistoryPhotos(photos: photos)),
    );
  }

  final PhotoService _photoService;

  onGetPhotos(GetHistoryPhotos event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(photos: state.photos));
  }

  onPressSelect(PressSelect event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(photos: state.photos));
  }

  onPressItem(PressHistoryItem event, Emitter<HistoryState> emit) {
    if (state is HistorySelecting) {
      final selected = {...(state as HistorySelecting).selected};
      selected.selection(event.index);
      emit(HistorySelecting(selected: selected, photos: state.photos));
    }
  }

  onPressSelectAll(PressSelectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelectAll(photos: state.photos));
  }

  onPressDeselectAll(PressDeselectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelecting(selected: <int>{}, photos: state.photos));
  }

  onPressCancelSelect(PressCancelSelect event, Emitter<HistoryState> emit) {
    emit(HistoryInitial(photos: state.photos));
  }
}
