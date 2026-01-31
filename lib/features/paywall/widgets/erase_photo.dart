import 'dart:io';
import 'package:erasica/core/const/assets_path.dart';
import 'package:flutter/material.dart';
import '../../../entities/photo/photo.dart';

class ErasePhotoBox extends StatelessWidget {
  const ErasePhotoBox({super.key, required this.photo});

  final Photo? photo;

  @override
  Widget build(BuildContext context) {
    final size = double.infinity;
    final fit = BoxFit.cover;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Image.asset(AssetsPath.withoutBg, width: size, height: size, fit: fit),
        photo != null
            ? Image.file(
                File(photo!.photoPath),
                alignment: Alignment.center,
                width: size,
                height: size,
                fit: fit,
              )
            : Image.asset(
                AssetsPath.paywallEraseReady,
                alignment: Alignment.center,
                width: size,
                height: size,
                fit: fit,
              ),
        _InitialPhotoSwiper(photo: photo),
      ],
    );
  }
}

class _InitialPhotoSwiper extends StatefulWidget {
  final Photo? photo;

  const _InitialPhotoSwiper({this.photo});
  @override
  _InitialPhotoSwiperState createState() => _InitialPhotoSwiperState();
}

class _InitialPhotoSwiperState extends State<_InitialPhotoSwiper> {
  double initialPhotoWidth = 150;
  double minWidth = 40 - 10;
  void updateSize(DragUpdateDetails details, BoxConstraints constraints) {
    initialPhotoWidth += details.delta.dx;
    if (initialPhotoWidth > constraints.maxWidth) {
      initialPhotoWidth = constraints.maxWidth;
    }
    if (initialPhotoWidth < minWidth) {
      initialPhotoWidth = minWidth;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  width: initialPhotoWidth - 20,
                  decoration: BoxDecoration(),
                  clipBehavior: Clip.antiAlias,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        child: widget.photo == null
                            ? Image.asset(
                                AssetsPath.paywallEraseInitial,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(widget.photo!.initialPath),
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  width: initialPhotoWidth,

                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onHorizontalDragUpdate: (details) =>
                          updateSize(details, constraints),
                      child: Container(
                        width: 36,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(width: 5, color: Colors.white),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: ShapeDecoration(
                                color: const Color(0x19111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: const ShapeDecoration(
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 2,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 4.50,
                                    top: 4.50,
                                    child: Container(
                                      width: 27,
                                      height: 27,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
