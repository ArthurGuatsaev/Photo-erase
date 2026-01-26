import 'package:carousel_slider/carousel_slider.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/sliders/carusel/cubit/carusel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCarusel extends StatefulWidget {
  const AppCarusel({super.key, required this.items, this.needIndicator = true});
  final List<Widget> items;
  final bool needIndicator;
  @override
  State<AppCarusel> createState() => _AppCaruselState();
}

class _AppCaruselState extends State<AppCarusel> {
  late final caruselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return BlocProvider(
      create: (context) => CaruselCubit(items: widget.items.length),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CaruselCubit, CaruselState>(
            builder: (context, state) {
              return Column(
                spacing: 16,
                children: [
                  Expanded(
                    child: CarouselSlider(
                      carouselController: caruselController,
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        aspectRatio: 375 / 302,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index, reason) {
                          context.read<CaruselCubit>().pressNextItem(index);
                        },
                      ),
                      items: widget.items,
                    ),
                  ),
                  if (widget.needIndicator)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4.w,
                      children: [
                        for (var i = 0; i < state.items; i++)
                          AnimatedContainer(
                            width: i == state.current ? 36.w : 14.w,
                            height: 6.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: i == state.current
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            duration: styleData.animationDuration,
                            curve: styleData.curve,
                          ),
                      ],
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
