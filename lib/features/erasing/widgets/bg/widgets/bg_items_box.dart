import 'package:flutter/cupertino.dart';

import '../../../blocs/erase/erase_bloc.dart';
import '/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../../../../widgets/wrapper/glass.dart';
import '../bg_cubit/bg_cubit.dart';
import 'bg_item.dart';

class BgItemsBox extends StatelessWidget {
  const BgItemsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final bgCubit = context.read<BgCubit>();
    return SizedBox(
      height: 56,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,

        slivers: [
          SliverPadding(padding: EdgeInsets.only(left: 16)),
          SliverToBoxAdapter(
            child: Row(
              spacing: 8,
              children: [
                GlassIconBtn(
                  icon: CupertinoIcons.photo,
                  onTap: () {
                    bgCubit.onPressPickGallery();
                  },
                  data: context.glassButtonData.data,
                ),
                GlassIconBtn(
                  icon: CupertinoIcons.globe,
                  onTap: () {
                    bgCubit.pressWebButton();
                  },
                  data: context.glassButtonData.data,
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(right: 16)),
          SliverToBoxAdapter(
            child: GlassWrapper(
              data: context.glass.darkBox,
              borderRadius: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<BgCubit, BgState>(
                  builder: (context, state) {
                    return Row(
                      spacing: 8,
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
                          spacing: 8,
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
          SliverPadding(padding: EdgeInsets.only(right: 16)),
        ],
      ),
    );
  }
}
