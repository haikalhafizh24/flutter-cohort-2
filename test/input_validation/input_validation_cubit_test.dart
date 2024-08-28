import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/application/input_validation_cubit/input_validation_cubit.dart';

void main() {
  group('InputValidationCubit', () {
    late InputValidationCubit cubit;

    setUp(() {
      cubit = InputValidationCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is correct', () {
      expect(cubit.state, equals(InputValidationState.initial()));
    });

    blocTest<InputValidationCubit, InputValidationState>(
      'emits new state when inputName is called',
      build: () => cubit,
      act: (cubit) => cubit.inputName('John Doe'),
      expect: () => [
        isA<InputValidationState>()
            .having((s) => s.entity.name, 'name', 'John Doe')
            .having((s) => s.isValid, 'isValid', false)
      ],
    );

    blocTest<InputValidationCubit, InputValidationState>(
      'emits new state when inputEmail is called',
      build: () => cubit,
      act: (cubit) => cubit.inputEmail('john@example.com'),
      expect: () => [
        isA<InputValidationState>()
            .having((s) => s.entity.email, 'email', 'john@example.com')
            .having((s) => s.isValid, 'isValid', false)
      ],
    );

    blocTest<InputValidationCubit, InputValidationState>(
      'emits valid state when submit is called with valid inputs',
      build: () => cubit,
      act: (cubit) {
        cubit.inputName('John Doe');
        cubit.inputEmail('john@example.com');
        cubit.submit();
      },
      expect: () => [
        isA<InputValidationState>()
            .having((s) => s.entity.name, 'name', 'John Doe')
            .having((s) => s.isValid, 'isValid', false),
        isA<InputValidationState>()
            .having((s) => s.entity.email, 'email', 'john@example.com')
            .having((s) => s.isValid, 'isValid', false),
        isA<InputValidationState>()
            .having((s) => s.isValid, 'isValid', true)
            .having((s) => s.showError, 'showError', false)
      ],
    );

    blocTest<InputValidationCubit, InputValidationState>(
      'emits error state when submit is called with invalid inputs',
      build: () => cubit,
      act: (cubit) {
        cubit.inputName('');
        cubit.inputEmail('invalid-email');
        cubit.submit();
      },
      expect: () => [
        isA<InputValidationState>()
            .having((s) => s.entity.name, 'name', '')
            .having((s) => s.isValid, 'isValid', false),
        isA<InputValidationState>()
            .having((s) => s.entity.email, 'email', 'invalid-email')
            .having((s) => s.isValid, 'isValid', false),
        isA<InputValidationState>()
            .having((s) => s.showError, 'showError', true)
            .having((s) => s.isValid, 'isValid', false)
      ],
    );

    test('title and subtitle are correct when state is valid', () {
      cubit.inputName('John Doe');
      cubit.inputEmail('john@example.com');
      cubit.submit();

      expect(cubit.state.title, equals('Welcome back, John Doe'));
      expect(
          cubit.state.subTitle,
          equals(
              'We happy to see you here again. john@example.com is your email address'));
    });

    test('title and subtitle are default when state is invalid', () {
      expect(cubit.state.title, equals('Welcome back,'));
      expect(
          cubit.state.subTitle,
          equals(
              'We happy to see you here again. Enter your name and email address'));
    });

    test('error messages are null when showError is false', () {
      cubit.inputName('');
      cubit.inputEmail('invalid-email');

      expect(cubit.state.showNameErrorMsg, isNull);
      expect(cubit.state.showEmailErrorMsg, isNull);
    });

    test('error messages are shown when showError is true', () {
      cubit.inputName('');
      cubit.inputEmail('invalid-email');
      cubit.submit();

      expect(cubit.state.showNameErrorMsg, equals('Name cannot be empty'));
      expect(cubit.state.showEmailErrorMsg, equals('Email is invalid'));
    });
  });
}
