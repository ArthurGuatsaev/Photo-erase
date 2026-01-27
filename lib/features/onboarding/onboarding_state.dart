// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onboarding_cubit.dart';

class OnboardingState {
  const OnboardingState({
    this.currentStepIndex = 0,
    this.showReviews = true,
    this.selectedQuestionsStep4 = const {},
    this.selectedQuestionsStep5 = const {},
    this.ratingPlace,
    this.allowNext = false,
  });

  final int currentStepIndex;
  final bool showReviews;
  final Set<String> selectedQuestionsStep4;
  final Set<String> selectedQuestionsStep5;
  final RatingPlace? ratingPlace;
  final bool allowNext;

  List<OnboardingStep> get steps {
    return [
      OnboardingStep.step0,
      OnboardingStep.step1,
      OnboardingStep.step2,
      if (showReviews) OnboardingStep.step3Review,
      OnboardingStep.step4Questions,
      OnboardingStep.step5Questions,
    ];
  }

  bool get isLast => steps.length - 1 == currentStepIndex;
  bool get needReview =>
      currentStep == OnboardingStep.step3Review &&
      ratingPlace == RatingPlace.onboarding;

  OnboardingStep get currentStep => steps[currentStepIndex];

  int get totalSteps {
    return steps.length;
  }

  OnboardingState copyWith({
    int? currentStepIndex,
    bool? showReviews,
    Set<String>? selectedQuestionsStep4,
    Set<String>? selectedQuestionsStep5,
    RatingPlace? ratingPlace,
    bool? allowNext,
  }) {
    return OnboardingState(
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      showReviews: showReviews ?? this.showReviews,
      selectedQuestionsStep4:
          selectedQuestionsStep4 ?? this.selectedQuestionsStep4,
      selectedQuestionsStep5:
          selectedQuestionsStep5 ?? this.selectedQuestionsStep5,
      ratingPlace: ratingPlace ?? this.ratingPlace,
      allowNext: allowNext ?? this.allowNext,
    );
  }
}
