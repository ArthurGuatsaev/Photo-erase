import 'package:erasica/features/onboarding/model/onboarding_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../onboarding_cubit.dart';
import 'question_item.dart';

class OnboardingQuestions extends StatelessWidget {
  const OnboardingQuestions({super.key, required this.step});
  final OnboardingStep step;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (_, index) {
            final option = step.questions[index];
            return QuestionItem(
              option: option,
              isSelected: state.selectedQuestionsStep4.contains(option),
              onTap: () {
                context.read<OnboardingCubit>().toggleQuestionOption(
                  step.questions[index],
                );
              },
            );
          },
          separatorBuilder: (_, _) => SizedBox(height: 16.h),
          itemCount: step.questions.length,
        );
      },
    );
  }
}
