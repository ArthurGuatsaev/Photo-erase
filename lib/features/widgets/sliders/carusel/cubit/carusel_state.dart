// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'carusel_cubit.dart';

class CaruselState extends Equatable {
  const CaruselState({required this.items, required this.current});
  final int items;
  final int current;
  @override
  List<Object> get props => [current];

  CaruselState copyWith({int? items, int? current}) {
    return CaruselState(
      items: items ?? this.items,
      current: current ?? this.current,
    );
  }
}
