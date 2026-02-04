import 'package:flutter/material.dart';
import '../../model/onboarding_step.dart';
import 'question_item.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
    required this.step,
    required this.selection,
    required this.onTap,
  });

  final OnboardingStep step;
  final Set<String> selection;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount: step.questions.length,
      separatorBuilder: (_, _) => SizedBox(height: 16),
      itemBuilder: (_, index) {
        final option = step.questions[index];
        return QuestionItem(
          option: option,
          isSelected: selection.contains(option),
          onTap: () => onTap(index),
        );
      },
    );
  }
}
