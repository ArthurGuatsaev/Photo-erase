import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onboarding_cubit.dart';

class OnboardingStepIndicator extends StatelessWidget {
  const OnboardingStepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (prev, next) => prev.currentStepIndex != next.currentStepIndex,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            for (var i = 0; i < state.totalSteps; i++)
              AnimatedContainer(
                width: i == state.currentStepIndex ? 36 : 14,
                height: 6,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: i == state.currentStepIndex
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.08),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                duration: styleData.animationDuration,
                curve: styleData.curve,
              ),
          ],
        );
      },
    );
  }
}
