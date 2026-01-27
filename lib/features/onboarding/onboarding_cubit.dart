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

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._appService, PaymentService _paymentService)
    : super(
        OnboardingState(
          showReviews: _paymentService.state.metadata.showOnboardingReviews,
          ratingPlace: _paymentService.state.metadata.ratingPlace,
        ),
      );

  final AppService _appService;

  void nextStep() {
    if (state.isLast) {
      _closeOnboarding();
    } else {
      if (state.needReview) _appService.requestReview();
      emit(state.copyWith(currentStepIndex: state.currentStepIndex + 1));
    }
  }

  void toggleQuestionOption(String option) {
    final currentQuestions = Set<String>.from(state.selectedQuestionsStep4);
    currentQuestions.selection(option);
    emit(state.copyWith(selectedQuestionsStep4: currentQuestions));
  }

  Future<void> _closeOnboarding() async {
    appRouter.replaceAll([
      PaywallRoute(placementType: PlacementType.onboarding),
    ]);
  }
}
