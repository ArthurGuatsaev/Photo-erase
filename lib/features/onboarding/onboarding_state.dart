// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'onboarding_cubit.dart';

class OnboardingState {
  const OnboardingState({
    this.currentStepIndex = 0,
    this.showReviews = true,
    this.showQuestions = true,
    this.showSignature = true,
    this.selectedQuestionsStep4 = const {},
    this.selectedQuestionsStep5 = const {},
    this.ratingPlace,
    this.allowNext = false,
  });

  final int currentStepIndex;
  final bool showReviews;
  final bool showQuestions;
  final bool showSignature;
  final Set<String> selectedQuestionsStep4;
  final Set<String> selectedQuestionsStep5;
  final RatingPlace? ratingPlace;
  final bool allowNext;

  List<OnboardingStep> get steps {
    return [
      OnboardingStep.step0,
      OnboardingStep.step1,
      OnboardingStep.step2,
      OnboardingStep.step3,
      OnboardingStep.step4,
      OnboardingStep.step5,
    ];
  }

  OnboardingStep get currentStep {
    return steps[currentStepIndex];
  }

  int get totalSteps {
    return steps.length;
  }

  OnboardingState copyWith({
    int? currentStepIndex,
    bool? showReviews,
    bool? showQuestions,
    bool? showSignature,
    Set<String>? selectedQuestionsStep4,
    Set<String>? selectedQuestionsStep5,
    RatingPlace? ratingPlace,
    bool? allowNext,
  }) {
    return OnboardingState(
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      showReviews: showReviews ?? this.showReviews,
      showQuestions: showQuestions ?? this.showQuestions,
      showSignature: showSignature ?? this.showSignature,
      selectedQuestionsStep4:
          selectedQuestionsStep4 ?? this.selectedQuestionsStep4,
      selectedQuestionsStep5:
          selectedQuestionsStep5 ?? this.selectedQuestionsStep5,
      ratingPlace: ratingPlace ?? this.ratingPlace,
      allowNext: allowNext ?? this.allowNext,
    );
  }
}
