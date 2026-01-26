// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'mask_cubit.dart';

class MaskState {
  final double lineSize;
  final List<Offset> currentStroke;
  final List<DrawingStroke> strokes;
  final List<DrawingStroke> redoStack;
  final bool isLoading;
  final FrameInfo? frame;
  final Path currentPath;
  final bool isDrawing;
  MaskState({
    this.lineSize = 10.0,
    this.currentStroke = const [],
    this.strokes = const [],
    this.redoStack = const [],
    this.isLoading = false,
    this.frame,
    this.isDrawing = false,
    required this.currentPath,
  });

  MaskState copyWith({
    double? lineSize,
    List<Offset>? currentStroke,
    List<DrawingStroke>? strokes,
    List<DrawingStroke>? redoStack,
    bool? isLoading,
    FrameInfo? frame,
    Path? currentPath,
    bool? isDrawing,
  }) {
    return MaskState(
      lineSize: lineSize ?? this.lineSize,
      currentStroke: currentStroke ?? this.currentStroke,
      strokes: strokes ?? this.strokes,
      redoStack: redoStack ?? this.redoStack,
      isLoading: isLoading ?? this.isLoading,
      frame: frame ?? this.frame,
      currentPath: currentPath ?? this.currentPath,
      isDrawing: isDrawing ?? this.isDrawing,
    );
  }

  bool get canUndo => strokes.isNotEmpty;
  bool get canRedo => redoStack.isNotEmpty;
  bool get hasStrokes => strokes.isNotEmpty;
  ui.Image? get bgImage => frame?.image;
  double? get imageWidth => frame?.image.width.toDouble();
  double? get imageHeight => frame?.image.height.toDouble();
}

class DrawingStroke {
  const DrawingStroke({required this.points, required this.details});

  final List<Offset> points;
  final DrawingDetails details;
}

class DrawingDetails {
  final double size;
  final Path path;
  const DrawingDetails({required this.size, required this.path});
}
