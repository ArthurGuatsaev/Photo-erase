import 'package:erasica/core/const/system_untils.dart';
import 'package:erasica/services/payments/payment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../core/router/router.gr.dart';
import '../../main.dart';
import '../../services/app/app_service.dart';
import '../../services/payments/models/placement_type.dart';
import '../../services/payments/models/rating_place.dart';
import 'model/onboarding_step.dart';

part 'onboarding_state.dart';

@LazySingleton()
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._appService, PaymentService _paymentService)
    : super(
        OnboardingState(
          selectedQuestionStyles: OnboardingStep.step5QuestionsStyles.questions
              .toSet(),
          showReviews: _paymentService.state.metadata.showOnboardingReviews,
          ratingPlace: _paymentService.state.metadata.ratingPlace,
        ),
      );

  final AppService _appService;

  void nextStep() {
    if (state.isLast) {
      _closeOnboarding();
    } else {
      emit(state.copyWith(currentStepIndex: state.currentStepIndex + 1));
    }
  }

  void toggleQuestionOption4(String option) {
    final newSelected = {...state.selectedQuestionsGoal}..selection(option);
    emit(state.copyWith(selectedQuestionsStep4: newSelected));
  }

  void toggleQuestionOption5(String option) {
    final newSelected = {...state.selectedQuestionStyles}..selection(option);
    emit(state.copyWith(selectedQuestionsStep5: newSelected));
  }

  Future<void> requestAtt() async {
    await _appService.requestATT();
  }

  Future<void> requestReview() async {
    await _appService.requestReview();
  }

  Future<void> _closeOnboarding() async {
    appRouter.replaceAll([
      MainRoute(),
      PaywallRoute(placementType: PlacementType.onboarding),
    ]);
  }
}
