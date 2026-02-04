import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/features/widgets/shapes/cashed_image.dart';
import 'package:erasica/features/widgets/shapes/glass_container.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../erasing/widgets/bg/web_bg_cubit/web_bg_cubit.dart';
import '../../erasing/widgets/bg/widgets/bg_web_empty.dart';
import '../buttons/leading_button.dart';
import '../shapes/text_fielda.dart';
import '../text/text_row.dart';
import '../wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetBackground extends StatefulWidget {
  const SheetBackground({super.key});
  @override
  State<SheetBackground> createState() => _SheetBackgroundState();

  static SheetBackground show() => SheetBackground();
}

class _SheetBackgroundState extends State<SheetBackground> {
  final cubit = getIt<WebBgCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BackgroundWrapper(
        isModalSheet: true,
        isDefault: true,
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              AppBar(
                leadingWidth: 70,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: LeadingBtn(
                    icon: CupertinoIcons.chevron_back,
                    onTap: appRouter.maybePop,
                  ),
                ),
                actionsPadding: EdgeInsets.only(right: 24),
                title: TextRow(
                  text: 'background',
                  style: context.text.appbarTitle.copyWith(
                    color: context.color.title,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: context.appWidget.data.pagePadding,
                child: AppTextField(
                  onChanged: cubit.pressSearchText,
                  hint: 'hint_search_bg'.tr(),
                ),
              ),
              Expanded(
                child: BlocBuilder<WebBgCubit, WebBgState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                    if (state.searchWebImages.isEmpty) {
                      return BgWebEmpty();
                    }
                    return Padding(
                      padding: context.appWidget.data.pagePadding.copyWith(
                        top: 20,
                      ),
                      child: GridView.builder(
                        itemCount: state.searchWebImages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final item = state.searchWebImages[index];
                          return GestureDetector(
                            onTap: () {
                              appRouter.maybePop(item);
                            },
                            child: GlassContainer(
                              borderRadius: 14,
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: AppCachedImage(path: item.smallUrl),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
