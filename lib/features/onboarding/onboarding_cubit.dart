import 'package:erasica/core/const/system_untils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../services/app/app_service.dart';
import '../../services/payments/models/rating_place.dart';
import 'model/onboarding_step.dart';

part 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._appService)
    : super(
        OnboardingState(
          // showQuestions: paymentService.state.metadata.showOnboardingQuestions,
          // showSignature: paymentService.state.metadata.showOnboardingSignature,
          // showReviews: paymentService.state.metadata.showOnboardingReviews,
          // ratingPlace: paymentService.state.metadata.ratingPlace,
        ),
      );

  final AppService _appService;

  final snapshotKey = GlobalKey();

  Future<void> nextStep() async {
    if (state.steps[state.currentStepIndex] == OnboardingStep.step3 &&
        state.ratingPlace == RatingPlace.onboarding) {
      // _appService.requestReview();
    }
    emit(state.copyWith(currentStepIndex: state.currentStepIndex + 1));
  }

  void toggleQuestionOption(String option) {
    final currentQuestions = Set<String>.from(state.selectedQuestionsStep4);
    currentQuestions.selection(option);
    emit(state.copyWith(selectedQuestionsStep4: currentQuestions));
  }

  Future<void> _closeOnboarding() async {
    // _appService.markAppLaunched();
    // appRouter.replaceAll([
    //   PaywallRoute(placementType: PlacementType.onboarding),
    // ]);
  }

  void changeNextStatus(bool value) {
    emit(state.copyWith(allowNext: value));
  }
}
