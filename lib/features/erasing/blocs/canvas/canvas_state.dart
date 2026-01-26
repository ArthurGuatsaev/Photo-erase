part of 'canvas_bloc.dart';

sealed class CanvasState {}

class CanvasInitial extends CanvasState {}

class CanvasReady extends CanvasState {
  final Size canvasSize;
  final FrameInfo frame;
  CanvasReady({required this.canvasSize, required this.frame});
}
