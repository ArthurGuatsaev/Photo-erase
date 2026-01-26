import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../blocs/erase/erase_bloc.dart';
import '../bg_cubit/bg_cubit.dart';

class BgShower extends StatelessWidget {
  const BgShower({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BgCubit, BgState>(
      listenWhen: (previous, current) => previous.activeBg != current.activeBg,
      listener: (context, state) {
        context.read<EraseBloc>().add(SetActiveBg(bg: state.activeBg));
      },
      builder: (context, state) {
        if (state.activeBg is LinearGradient) {
          return Container(
            decoration: BoxDecoration(
              gradient: state.activeBg as LinearGradient,
            ),
          );
        }
        if (state.activeBg is Color) {
          return Container(
            decoration: BoxDecoration(color: state.activeBg as Color),
          );
        }
        if (state.activeBg is XFile) {
          return Image.file(
            File((state.activeBg as XFile).path),
            fit: BoxFit.cover,
          );
        }
        if (state.activeBg is String) {
          return Image.asset(state.activeBg as String, fit: BoxFit.cover);
        }

        return Container();
      },
    );
  }
}
