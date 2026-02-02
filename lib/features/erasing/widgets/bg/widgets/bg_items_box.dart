import '../../../blocs/erase/erase_bloc.dart';
import '/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../../../../widgets/wrapper/glass.dart';
import '../bg_cubit/bg_cubit.dart';
import 'bg_item.dart';

class BgItemsBox extends StatelessWidget {
  const BgItemsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,

        slivers: [
          SliverPadding(padding: EdgeInsets.only(left: 16.w)),
          SliverToBoxAdapter(
            child: Row(
              spacing: 8.w,
              children: [
                GlassIconBtn(
                  icon: AssetsPath.iconGallery,
                  onTap: () {
                    context.read<BgCubit>().onPressPickGallery();
                  },
                  data: context.glassButtonData.data,
                ),
                GlassIconBtn(
                  icon: AssetsPath.iconWeb,
                  onTap: () {},
                  data: context.glassButtonData.data,
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(right: 16.w)),
          SliverToBoxAdapter(
            child: GlassWrapper(
              data: context.glass.box,
              borderRadius: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<BgCubit, BgState>(
                  builder: (context, state) {
                    return Row(
                      spacing: 8.w,
                      children: [
                        BgItem(
                          object: AssetsPath.iosColorPicker,
                          onTap: () {
                            context.read<EraseBloc>().add(PressEraseBg());
                            context.read<BgCubit>().onPressColorPicker();
                          },
                        ),
                        //чтобы не дублировать (они уже есть ниже)
                        if (state.activeBg is! String &&
                            state.activeBg is! LinearGradient)
                          BgItem(object: state.activeBg),
                        BgItem(
                          object: AssetsPath.withoutBg,
                          onTap: () {
                            context.read<BgCubit>().onPressClear();
                            context.read<EraseBloc>().add(PressEraseBg());
                          },
                        ),
                        Row(
                          spacing: 8.w,
                          children: state.gradientList.map((e) {
                            return BgItem(
                              object: e,
                              onTap: () {
                                context.read<EraseBloc>().add(PressEraseBg());
                                context.read<BgCubit>().onPressGradient(e);
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(right: 16.w)),
        ],
      ),
    );
  }
}
