import 'dart:io';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/features/main/blocs/app/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../../../entities/photo/photo.dart';
import '../../main/blocs/photo/photo_bloc.dart';
import '../buttons/glass_icon_btn.dart';
import '../buttons/leading_button.dart';
import '../buttons/main_button.dart';
import '../loading/loading_adaptive.dart';
import '../wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetResult extends StatelessWidget {
  const SheetResult({super.key, required this.photo, required this.photoBloc});
  final Photo photo;
  final PhotoBloc photoBloc;
  @override
  Widget build(BuildContext context) {
    final appCubit = getIt<AppCubit>();
    return BlocProvider(
      create: (context) => appCubit,
      child: BackgroundWrapper(
        isModalSheet: true,
        isDefault: true,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              AppBar(
                leadingWidth: 70,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: LeadingBtn(
                    icon: CupertinoIcons.clear,
                    onTap: appRouter.maybePop,
                  ),
                ),
                actionsPadding: const EdgeInsets.only(right: 24),
                actions: [
                  GlassIconBtn(
                    color: const Color.fromRGBO(226, 17, 17, 1),
                    data: context.glassButtonData.appbarData,
                    icon: CupertinoIcons.delete,
                    onTap: () {
                      photoBloc.add(
                        PressDeletePhotos(
                          photos: [photo],
                          backCallback: () {
                            appRouter.maybePop();
                            appRouter.popUntil(
                              (route) => route.settings.name == 'MainRoute',
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(photo.photoPath),
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const AdaptiveLoading(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Row(
                  spacing: 12,
                  children: [
                    GlassIconBtn(
                      data: context.glassButtonData.data,
                      icon: CupertinoIcons.create,
                      onTap: () {
                        appRouter.maybePop();
                        photoBloc.add(PressEditPhoto(photo: photo));
                      },
                    ),
                    Expanded(
                      child: BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          return MainButton(
                            title: 'share_btn',
                            onTap: () async {
                              if (state.needRequest) {
                                //TODO лучше бы перенести сразу на показ модалки
                                return await appCubit.showAppRequest();
                              } else {
                                final render =
                                    context.findRenderObject() as RenderBox;
                                appRouter.maybePop();
                                photoBloc.add(
                                  PressSharePhotos(
                                    photos: [photo],
                                    render: render,
                                  ),
                                );
                              }
                            },
                            icon: CupertinoIcons.share,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  static SheetResult show(Photo photo, PhotoBloc photoBloc) =>
      SheetResult(photo: photo, photoBloc: photoBloc);
}
