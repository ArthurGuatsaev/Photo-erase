import 'package:auto_route/auto_route.dart';
import 'package:erasica/features/widgets/buttons/main_button.dart';
import 'package:erasica/features/widgets/wrapper/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/di/di.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/widget_styles/app_data.dart';
import './widgets/onboarding_lottie.dart';
import 'model/onboarding_step.dart';
import 'widgets/questions/onboarding_questions.dart';
import 'widgets/review/onboarding_review.dart';
import './widgets/onboarding_step_indicator.dart';
import 'onboarding_cubit.dart';
import 'widgets/onboarding_title.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _stepsPageController = PageController();

  @override
  void dispose() {
    _stepsPageController.dispose();
    super.dispose();
  }

  void nextPage(AppWidgetData styleData) {
    if (_stepsPageController.hasClients) {
      _stepsPageController.nextPage(
        duration: styleData.animationDuration,
        curve: styleData.curve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: BackgroundWrapper(
        isDefault: true,
        child: Scaffold(
          body: BlocConsumer<OnboardingCubit, OnboardingState>(
            listenWhen: (prev, curr) =>
                prev.currentStepIndex != curr.currentStepIndex,
            listener: (context, state) => nextPage(styleData),
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              return SafeArea(
                child: Padding(
                  padding: styleData.pagePadding.copyWith(bottom: 42),
                  child: Column(
                    children: [
                      SizedBox(height: 14.h),
                      OnboardingStepIndicator(),
                      SizedBox(height: 20.h),
                      OnboardingTitleBox(step: state.currentStep),
                      Expanded(
                        child: PageView(
                          controller: _stepsPageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            OnboardingLottie(
                              "assets/animations/onboarding_0_step.json",
                            ),
                            OnboardingLottie(
                              "assets/animations/onboarding_1_step.json",
                            ),
                            OnboardingLottie(
                              "assets/animations/onboarding_2_step.json",
                            ),
                            if (state.showReviews) OnboardingReview(),
                            OnboardingQuestions(step: OnboardingStep.step4),
                            OnboardingQuestions(step: OnboardingStep.step5),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      MainButton(
                        onTap: cubit.nextStep,
                        title: state.currentStep.button,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
