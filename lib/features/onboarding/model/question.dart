import 'package:easy_localization/easy_localization.dart';

enum OnboardingQuestionOptionStep4 {
  removeObj,
  changeBg,
  productPhoto,
  socialPost,
  notSureYet;

  String get label {
    switch (this) {
      case OnboardingQuestionOptionStep4.removeObj:
        return 'onb4_question_0'.tr();
      case OnboardingQuestionOptionStep4.changeBg:
        return 'onb4_question_1'.tr();
      case OnboardingQuestionOptionStep4.productPhoto:
        return 'onb4_question_2'.tr();
      case OnboardingQuestionOptionStep4.socialPost:
        return 'onb4_question_3'.tr();
      case OnboardingQuestionOptionStep4.notSureYet:
        return 'onb4_question_4'.tr();
    }
  }
}

enum OnboardingQuestionOptionStep5 {
  defaultAuto,
  cleanCutout,
  studioBg,
  gradientBg,
  blurBg;

  String get label {
    switch (this) {
      case OnboardingQuestionOptionStep5.defaultAuto:
        return 'onb5_question_0'.tr();
      case OnboardingQuestionOptionStep5.cleanCutout:
        return 'onb5_question_1'.tr();
      case OnboardingQuestionOptionStep5.studioBg:
        return 'onb5_question_2'.tr();
      case OnboardingQuestionOptionStep5.gradientBg:
        return 'onb5_question_3'.tr();
      case OnboardingQuestionOptionStep5.blurBg:
        return 'onb5_question_4'.tr();
    }
  }
}
