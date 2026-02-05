// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onboarding_cubit.dart';

class OnboardingState {
  const OnboardingState({
    this.currentStepIndex = 0,
    this.showReviews = true,
    this.selectedQuestionsGoal = const {},
    required this.selectedQuestionStyles,
    this.ratingPlace,
    this.allowNext = false,
  });

  final int currentStepIndex;
  final bool showReviews;
  final Set<String> selectedQuestionsGoal;
  final Set<String> selectedQuestionStyles;
  final RatingPlace? ratingPlace;
  final bool allowNext;

  List<OnboardingStep> get steps {
    return [
      OnboardingStep.step0,
      OnboardingStep.step1,
      OnboardingStep.step2,
      if (showReviews) OnboardingStep.step3Review,
      OnboardingStep.step4QuestionsGoal,
      OnboardingStep.step5QuestionsStyles,
    ];
  }

  bool get isLast => steps.length - 1 == currentStepIndex;
  bool get isShowAtt => isLast;
  bool get needReview =>
      currentStep == OnboardingStep.step4QuestionsGoal &&
      ratingPlace == RatingPlace.onboarding;

  OnboardingStep get currentStep => steps[currentStepIndex];

  int get totalSteps {
    return steps.length;
  }

  OnboardingState copyWith({
    int? currentStepIndex,
    bool? showReviews,
    Set<String>? selectedQuestionsGoal,
    Set<String>? selectedQuestionStyles,
    RatingPlace? ratingPlace,
    bool? allowNext,
  }) {
    return OnboardingState(
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      showReviews: showReviews ?? this.showReviews,
      selectedQuestionsGoal:
          selectedQuestionsGoal ?? this.selectedQuestionsGoal,
      selectedQuestionStyles:
          selectedQuestionStyles ?? this.selectedQuestionStyles,
      ratingPlace: ratingPlace ?? this.ratingPlace,
      allowNext: allowNext ?? this.allowNext,
    );
  }
}
