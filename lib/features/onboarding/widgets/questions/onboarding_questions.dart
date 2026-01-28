import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/onboarding_step.dart';
import '../../onboarding_cubit.dart';
import 'question_list.dart';

class OnboardingQuestionsGoal extends StatelessWidget {
  const OnboardingQuestionsGoal({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return QuestionsList(
          step: OnboardingStep.step4QuestionsGoal,
          selection: state.selectedQuestionsGoal,
          onTap: (value) {
            context.read<OnboardingCubit>().toggleQuestionOption4(
              OnboardingStep.step4QuestionsGoal.questions[value],
            );
          },
        );
      },
    );
  }
}

class OnboardingQuestionsStyles extends StatelessWidget {
  const OnboardingQuestionsStyles({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return QuestionsList(
          step: OnboardingStep.step5QuestionsStyles,
          selection: state.selectedQuestionStyles,
          onTap: (value) {
            context.read<OnboardingCubit>().toggleQuestionOption5(
              OnboardingStep.step5QuestionsStyles.questions[value],
            );
          },
        );
      },
    );
  }
}
