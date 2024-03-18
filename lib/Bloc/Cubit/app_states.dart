abstract class AppStates {}

class InitialState extends AppStates {}

class SplashscreenLoading extends AppStates {}

class BottomNavChangedState extends AppStates {}

class ChangeDateCalender extends AppStates {}

class FilterReservationListState extends AppStates {}

class ChangeActiveStepState extends AppStates {}

class IncrementActiveStepState extends AppStates {}

class DecrementActiveStepState extends AppStates {}

class SignUpInitialState extends AppStates {}

class SignUpSuccessState extends AppStates {}

class SignUpErrorState extends AppStates {
  final String error;

  SignUpErrorState(this.error);
}

class LogInInitialState extends AppStates {}

class LogInSuccessState extends AppStates {}

class LogInErrorState extends AppStates {
  final String error;

  LogInErrorState(this.error);
}

class ResetInitialState extends AppStates {}

class ResetSuccessState extends AppStates {}

class ResetErrorState extends AppStates {
  final String error;
  ResetErrorState(this.error);
}

class LoadBannerState extends AppStates {}

class GetFirstModeState extends AppStates {}

class ChangeThemeContainerStatusState extends AppStates {}

class ChangeLanguageContainerStatusState extends AppStates {}

class ChangeAppLanguageState extends AppStates {}

class ChangeAppLanguageSuccessState extends AppStates {}

class UpdateNotificationStatus extends AppStates {}

class SaveNotificationStatus extends AppStates {}

class GenderChangeState extends AppStates {}

class changeCountryState extends AppStates {}

class ChangeTypeState extends AppStates {}

class MakeVideoNullState extends AppStates {}

class ChangePasswordVisibilityState extends AppStates {}

class ChangeConfirmPasswordVisibilityState extends AppStates {}

class ChangeLoginPasswordVisibilityState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;

  GetUserErrorState(this.error);
}

class GetVerificationAnswersLoadingState extends AppStates {}

class GetVerificationAnswersSuccessState extends AppStates {}

class GetVerificationAnswersErrorState extends AppStates {
  final String error;

  GetVerificationAnswersErrorState(this.error);
}

class UpdateUserLoadingState extends AppStates {}

class UpdateUserSuccessState extends AppStates {}

class UpdateUserErrorState extends AppStates {
  final String error;

  UpdateUserErrorState(this.error);
}

class UpdateUserImageLoadingState extends AppStates {}

class UpdateUserImageSuccessState extends AppStates {}

class UpdateUserImageErrorState extends AppStates {
  final String error;

  UpdateUserImageErrorState(this.error);
}

class DeleteUserLoadingState extends AppStates {}

class DeleteUserSuccessState extends AppStates {}

class DeleteUserErrorState extends AppStates {
  final String error;

  DeleteUserErrorState(this.error);
}

class GetRulesLoadingState extends AppStates {}

class GetRulesSuccessState extends AppStates {}

class GetRulesErrorState extends AppStates {
  final String error;

  GetRulesErrorState(this.error);
}

class GetTypesLoadingState extends AppStates {}

class GetTypesSuccessState extends AppStates {}

class GetTypesErrorState extends AppStates {
  final String error;

  GetTypesErrorState(this.error);
}

class AudioLoading extends AppStates {}

class AudioLoaded extends AppStates {}

class AudioPlaying extends AppStates {}

class AudioError extends AppStates {
  final String errorMessage;

  AudioError(this.errorMessage);
}
class DeleteRuleLoadingState extends AppStates {}

class DeleteRuleSuccessState extends AppStates {}

class DeleteRuleErrorState extends AppStates {
  final String error;

  DeleteRuleErrorState(this.error);
}
class AddRuleLoadingState extends AppStates {}

class AddRuleSuccessState extends AppStates {}

class AddRuleErrorState extends AppStates {
  final String error;

  AddRuleErrorState(this.error);
}

class UpdateRuleLoadingState extends AppStates {}

class UpdateRuleSuccessState extends AppStates {}

class UpdateRuleErrorState extends AppStates {
  final String error;

  UpdateRuleErrorState(this.error);
}

class GetLevelLoadingState extends AppStates {}

class GetLevelSuccessState extends AppStates {}

class GetLevelErrorState extends AppStates {
  final String error;

  GetLevelErrorState(this.error);
}

class GetLessonLoadingState extends AppStates {}

class GetLessonSuccessState extends AppStates {}

class GetLessonErrorState extends AppStates {
  final String error;

  GetLessonErrorState(this.error);
}

class GetPaymentsLoadingState extends AppStates {}

class GetPaymentsSuccessState extends AppStates {}

class GetPaymentsErrorState extends AppStates {
  final String error;

  GetPaymentsErrorState(this.error);
}

class PaymentInitialState extends AppStates {}

class PaymentSuccessState extends AppStates {}

class PaymentErrorState extends AppStates {
  String error;
  PaymentErrorState(this.error);
}

class PaymentOrderIDLoadingState extends AppStates {}
class PaymentOrderIDSuccessState extends AppStates {}

class PaymentOrderIDErrorState extends AppStates {
  String error;
  PaymentOrderIDErrorState(this.error);
}

class PaymentRequestTokenCardLoadingState extends AppStates {}
class PaymentRequestTokenCardSuccessState extends AppStates {}

class PaymentRequestTokenCardErrorState extends AppStates {
  String error;
  PaymentRequestTokenCardErrorState(this.error);
}
class PaymentRequestTokenCardForWalletLoadingState extends AppStates {}
class PaymentRequestTokenCardForWalletSuccessState extends AppStates {}

class PaymentRequestTokenCardForWalletErrorState extends AppStates {
  String error;
  PaymentRequestTokenCardForWalletErrorState(this.error);
}

class PaymentRequestWalletLoadingState extends AppStates {}
class PaymentRequestWalletSuccessState extends AppStates {}

class PaymentRequestWalletErrorState extends AppStates {
  String error;
  PaymentRequestWalletErrorState(this.error);
}

class PaymentRequestTokenKioskLoadingState extends AppStates {}

class PaymentRequestTokenKioskSuccessState extends AppStates {}

class PaymentRequestTokenKioskErrorState extends AppStates {
  String error;
  PaymentRequestTokenKioskErrorState(this.error);
}

class SearchState extends AppStates {}
class ChangeStatementsLanguageState extends AppStates {}

class PaymentRefCodeLoadingState extends AppStates {}
class PaymentRefCodeSuccessState extends AppStates {}

class PaymentRefCodeErrorState extends AppStates {
  String error;
  PaymentRefCodeErrorState(this.error);
}