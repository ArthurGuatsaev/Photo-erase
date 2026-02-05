import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import '../../../entities/photo/photo.dart';
import '../../main/blocs/photo/photo_bloc.dart';
import '../buttons/leading_button.dart';
import '../../main/widgets/erase_button_box.dart';
import '/features/widgets/wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetErase extends StatelessWidget {
  const SheetErase({super.key, this.photo, required this.photoBloc});
  final Photo? photo;
  final PhotoBloc photoBloc;
  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isModalSheet: true,
      isDefault: true,
      child: SafeArea(
        top: false,
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppBar(
                leading: LeadingBtn(
                  icon: CupertinoIcons.clear,
                  onTap: appRouter.maybePop,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: EraseButtonsBox(photo: photo, photoBloc: photoBloc),
            ),
          ],
        ),
      ),
    );
  }

  static SheetErase show(PhotoBloc photoBloc, [Photo? photo]) =>
      SheetErase(photo: photo, photoBloc: photoBloc);
}
