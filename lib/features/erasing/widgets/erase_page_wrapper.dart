import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
import '../../../entities/photo/photo.dart';
import '../../main/blocs/photo/photo_bloc.dart';
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
    final photoBloc = getIt<PhotoBloc>();
    final canvasBloc = getIt<CanvasBloc>();
    final eraseBloc = getIt<EraseBloc>(param1: photo)..photoBloc = photoBloc;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => eraseBloc),
        BlocProvider(create: (context) => canvasBloc),
        BlocProvider(create: (context) => photoBloc),
      ],
      child: BackgroundWrapper(
        // isErase: true,
        isDefault: true,
        loading: const EraseLoadingBox(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: const LeadingBtn(icon: CupertinoIcons.clear),
            actions: [action],
          ),
          body: SafeArea(child: body),
        ),
      ),
    );
  }
}
