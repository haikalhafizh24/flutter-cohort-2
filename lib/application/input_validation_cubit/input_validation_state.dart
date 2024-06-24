part of 'input_validation_cubit.dart';

@freezed
class InputValidationState with _$InputValidationState {
  const InputValidationState._();
  //default constructor for initial state
  const factory InputValidationState({
    required InputValidationEntity entity,
    required bool showError,
    // to show an error after user hit submit button
    required bool isValid,
    // to display user name if the input is valid
  }) = _InputValidationState;

  factory InputValidationState.initial() => InputValidationState(
        entity: InputValidationEntity.empty(),
        showError: false,
        isValid: false,
      );

  InputValidationState get unmodified => copyWith(
        isValid: false,
      );

  String? get showNameErrorMsg => showError ? entity.nameErrorMsg : null;
  String? get showEmailErrorMsg => showError ? entity.emailErrorMsg : null;

  String get title {
    if (isValid) {
      return 'Welcome back, ${entity.name}';
    }
    return 'Welcome back,';
  }

  String get subTitle {
    if (isValid) {
      return 'We happy to see you here again. ${entity.email} is your email address';
    }
    return 'We happy to see you here again. Enter your name and email address';
  }
}
