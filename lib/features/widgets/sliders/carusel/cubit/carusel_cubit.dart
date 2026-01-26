import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carusel_state.dart';

class CaruselCubit extends Cubit<CaruselState> {
  CaruselCubit({required int items})
    : super(CaruselState(items: items, current: 0));

  void pressNextItem(int nextItem) {
    emit(state.copyWith(current: nextItem));
  }
}
