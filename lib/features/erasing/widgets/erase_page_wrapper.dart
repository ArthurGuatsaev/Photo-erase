import 'package:erasica/entities/photo/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/const/assets_path.dart';
import '../../../core/di/di.dart';
import '../../../services/erase/erase_service.dart';
import '../../../services/note/note_service.dart';
import '../../../services/photo/photo_service.dart';
import '../../widgets/buttons/leading_button.dart';
import '../../widgets/wrapper/background.dart';
import '../blocs/canvas/canvas_bloc.dart';
import '../blocs/erase/erase_bloc.dart';
import 'erase_loading.dart';

class ErasePageWrapper extends StatelessWidget {
  const ErasePageWrapper({
    super.key,
    required this.action,
    required this.body,
    required this.photo,
  });
  final Widget action;
  final Widget body;
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    final eraseService = getIt<EraseService>();
    final photoService = getIt<PhotoService>();
    final noteService = getIt<NoteService>();
    final eraseBloc = EraseBloc(
      initialPhoto: photo,
      eraseService: eraseService,
      photoService: photoService,
      noteService: noteService,
    );
    final canvasBloc = CanvasBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => eraseBloc),
        BlocProvider(create: (context) => canvasBloc),
      ],
      child: BackgroundWrapper(
        isErase: true,
        isDefault: true,
        loading: EraseLoadingBox(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: LeadingBtn(icon: AssetsPath.iconClose),
            actions: [action],
          ),
          body: SafeArea(child: body),
        ),
      ),
    );
  }
}
