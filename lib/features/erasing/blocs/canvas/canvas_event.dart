part of 'canvas_bloc.dart';

@immutable
sealed class CanvasEvent {}

class CreateBackgroundFrame extends CanvasEvent {
  final String image;
  final BoxConstraints constraints;
  CreateBackgroundFrame({required this.image, required this.constraints});
}
