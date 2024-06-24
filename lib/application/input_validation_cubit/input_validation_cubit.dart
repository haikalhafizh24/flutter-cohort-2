import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/input_validation/input_validation_entity.dart';

part 'input_validation_cubit.freezed.dart';
part 'input_validation_state.dart';

class InputValidationCubit extends Cubit<InputValidationState> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  InputValidationCubit() : super(InputValidationState.initial()) {
    nameController = TextEditingController()..addListener(onNameChange);
    // use cascade method => initialize and use a function
    emailController = TextEditingController()..addListener(onEmailChange);
  }

  void onNameChange() {
    inputName(nameController.text);
  }

  void onEmailChange() {
    inputEmail(emailController.text);
  }

  // keep the isvalid parameter to false, so name and email cannot be displayed without user pressed the submit button
  void inputName(String val) {
    emit(state.unmodified.copyWith.entity(name: val));
  }

  void inputEmail(String val) {
    emit(state.unmodified.copyWith.entity(email: val));
  }

  void submit() {
    state.entity.failureOption.fold(
      () => emit(state.unmodified.copyWith(isValid: true)),
      //to display name and email to title and subtitle after user hit submit
      (failure) => emit(state.unmodified.copyWith(showError: true)),
      // it there is error, show the
    );
  }
}
