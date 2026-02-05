import '../../../core/const/assets_path.dart';
import 'question.dart';
import 'review.dart';

enum OnboardingStep {
  step0(
    title: 'onboarding_0_title',
    subtitle: 'onboarding_0_subtitle',
    button: 'onboarding_next_button',
  ),
  step1(
    title: 'onboarding_1_title',
    subtitle: 'onboarding_1_subtitle',
    button: 'onboarding_next_button',
  ),
  step2(
    title: 'onboarding_2_title',
    subtitle: 'onboarding_2_subtitle',
    button: 'onboarding_next_button',
  ),
  step3Review(
    title: 'onboarding_3_title',
    subtitle: 'onboarding_3_subtitle',
    button: 'onboarding_next_button',
  ),
  step4QuestionsGoal(
    title: 'onboarding_4_title',
    subtitle: 'onboarding_4_subtitle',
    button: 'onboarding_next_button',
  ),
  step5QuestionsStyles(
    title: 'onboarding_5_title',
    subtitle: 'onboarding_5_subtitle',
    button: 'onboarding_end_button',
  );

  final String title;
  final String subtitle;
  final String button;
  const OnboardingStep({
    required this.title,
    required this.subtitle,
    required this.button,
  });

  List<String> get questions {
    switch (this) {
      case OnboardingStep.step0:
      case OnboardingStep.step1:
      case OnboardingStep.step2:
      case OnboardingStep.step3Review:
        return [];
      case OnboardingStep.step4QuestionsGoal:
        return OnboardingQuestionOptionStep4.values
            .map((e) => e.label)
            .toList();
      case OnboardingStep.step5QuestionsStyles:
        return OnboardingQuestionOptionStep5.values
            .map((e) => e.label)
            .toList();
    }
  }

  List<Review> get reviews {
    switch (this) {
      case OnboardingStep.step3Review:
        return [
          Review(
            name: 'review_name_0',
            rating: 4.9,
            text: 'review_description_0',
            avatarPath: AssetsPath.avatar1,
            isVisible: true,
          ),
          Review(
            name: 'review_name_1',
            rating: 4.8,
            text: 'review_description_1',
            avatarPath: AssetsPath.avatar2,
            isVisible: false,
          ),
          Review(
            name: 'review_name_2',
            rating: 5.0,
            text: 'review_description_2',
            avatarPath: AssetsPath.avatar3,
            isVisible: false,
          ),
        ];
      default:
        return [];
    }
  }
}
