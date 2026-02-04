import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:ios_color_picker/show_ios_color_picker.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../../core/const/system_untils.dart';
import '../../../../../services/erase/erase_service.dart';
import '../../../../../services/erase/model/web_bg.dart';
import '../../../../../services/photo/photo_service.dart';
import '../../../../../services/ui_message/ui_message_service.dart';
import '../../../../widgets/pop_up_content/sheet_background.dart';
import '../widgets/bg_gradients.dart';

part 'bg_state.dart';

@injectable
class BgCubit extends Cubit<BgState> {
  BgCubit(this._eraseService, this._messageService, this._photoService)
    : super(BgState(activeBg: AssetsPath.withoutBg));
  IOSColorPickerController colorPickerController = IOSColorPickerController();
  final EraseService _eraseService;
  final PhotoService _photoService;
  final UIMessageService _messageService;
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

  Future<void> pressWebButton() async {
    try {
      final bg = await _messageService.showAppSheet(SheetBackground.show());
      if (bg is WebBg) {
        emit(state.copyWith(loading: true));
        final bytes = await _eraseService.downloadWebBg(bg.largeUrl);
        final path = await _photoService.saveAfterChange(bytes);
        emit(state.copyWith(activeBg: XFile(path)));
      }
    } catch (_) {}
    emit(state.copyWith(loading: false));
  }
}
