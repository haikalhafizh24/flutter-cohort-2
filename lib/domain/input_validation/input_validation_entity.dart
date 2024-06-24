// Create entity if cubit has more than 1 state

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

part 'input_validation_entity.freezed.dart';

@freezed
class InputValidationEntity with _$InputValidationEntity {
  const InputValidationEntity._();
  // initialize in class

  const factory InputValidationEntity({
    required String name,
    required String email,
  }) = _InputValidationEntity;

  factory InputValidationEntity.empty() =>
      const InputValidationEntity(name: '', email: '');
  // initial value for the entity

  Option<FormFailure> get failureOption => FormValidator.emptyValidator(name)
      .andThen(() => FormValidator.emailValidator(
          email)) // to check if there's any error from 2 parameter(name and email)
      .fold(
        (failure) => some(
            failure), // return error to failureOption function if the error exist
        (_) => none(), // return nothing if there are no errors
      );

  String? get nameErrorMsg => FormValidator.emptyValidator(name).fold(
        (failure) => failure.maybeWhen(
          orElse: () => null,
          empty: () => 'Name cannot be empty',
        ),
        (_) => null,
      );

  String? get emailErrorMsg => FormValidator.emailValidator(email).fold(
        (failure) => failure.maybeWhen(
          // maybeWhen method was used because you can just define the parameter that you want to use, so you don't need to define all parameter (if u use when)
          orElse: () => null,
          empty: () => 'Email cannot be empty',
          tooLong: () => 'Email must not exceed 50 characters',
          invalidEmailAddress: () => 'Email is invalid',
        ),
        (_) => null,
      );
}
