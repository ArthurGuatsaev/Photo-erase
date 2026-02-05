import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:meta/meta.dart';
import '../../../entities/photo/photo.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryInitial()) {
    on<PressSelect>(onPressSelect);
    on<PressSelectItem>(onPressItem);
    on<PressSelectAll>(onPressSelectAll);
    on<PressDeselectAll>(onPressDeselectAll);
    on<PressCancelSelect>(onPressCancelSelect);
  }

  onPressSelect(PressSelect event, Emitter<HistoryState> emit) {
    emit(const HistorySelecting());
  }

  onPressSelectAll(PressSelectAll event, Emitter<HistoryState> emit) {
    emit(HistorySelectAll(selected: event.photos));
  }

  onPressDeselectAll(PressDeselectAll event, Emitter<HistoryState> emit) {
    emit(const HistorySelecting(selected: <Photo>{}));
  }

  onPressCancelSelect(PressCancelSelect event, Emitter<HistoryState> emit) {
    emit(const HistoryInitial());
  }

  onPressItem(PressSelectItem event, Emitter<HistoryState> emit) {
    if (state is HistorySelecting || state is HistorySelectAll) {
      final selected = {...state.selected}..selection(event.photo);
      emit(HistorySelecting(selected: selected));
    }
  }
}
