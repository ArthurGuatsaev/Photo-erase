import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ios_color_picker/show_ios_color_picker.dart';

import '../widgets/bg_gradients.dart';

part 'bg_state.dart';

class BgCubit extends Cubit<BgState> {
  BgCubit() : super(BgState(activeBg: AssetsPath.withoutBg));
  IOSColorPickerController colorPickerController = IOSColorPickerController();

  void onPressGradient(LinearGradient gradient) {
    emit(state.copyWith(activeBg: gradient));
  }

  void onPressClear() {
    emit(state.copyWith(activeBg: AssetsPath.withoutBg));
  }

  Future<void> onPressColorPicker() async {
    await colorPickerController.showNativeIosColorPicker(
      onColorChanged: (color) async {
        emit(state.copyWith(activeBg: color));
      },
    );
  }

  void onPressPickGallery() async {
    try {
      final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      emit(state.copyWith(activeBg: xFile));
    } catch (e) {
      dprint(e.toString());
    }
  }
}
