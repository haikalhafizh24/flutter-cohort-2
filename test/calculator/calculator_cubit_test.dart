import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/application/calculator/calculator_cubit.dart';
import 'package:student_lecture_app/domain/calculator/calculator_entity.dart';
import 'package:student_lecture_app/domain/calculator/history_entity.dart';

void main() {
  group('CalculatorCubit', () {
    late CalculatorCubit calculatorCubit;

    setUp(() {
      calculatorCubit = CalculatorCubit();
    });

    tearDown(() {
      calculatorCubit.close();
    });

    test('initial state is correct', () {
      expect(calculatorCubit.state, CalculatorState.initial());
    });

    blocTest<CalculatorCubit, CalculatorState>(
      'emits new state when inputLeftValue is called',
      build: () => calculatorCubit,
      act: (cubit) => cubit.inputLeftValue('5'),
      expect: () => [
        CalculatorState.initial().copyWith.ent(leftValue: '5'),
      ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'emits new state when inputRightValue is called',
      build: () => calculatorCubit,
      act: (cubit) => cubit.inputRightValue('3'),
      expect: () => [
        CalculatorState.initial().copyWith.ent(rightValue: '3'),
      ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'emits new state when chooseType is called',
      build: () => calculatorCubit,
      act: (cubit) => cubit.chooseType(const CalculatorType.add()),
      expect: () => [
        CalculatorState.initial()
            .copyWith
            .ent(type: const CalculatorType.add()),
      ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'emits correct state when submit is called with valid input (addition)',
      build: () => calculatorCubit,
      act: (cubit) {
        cubit.inputLeftValue('5');
        cubit.inputRightValue('3');
        cubit.chooseType(const CalculatorType.add());
        cubit.submit();
      },
      expect: () => [
        CalculatorState.initial().copyWith.ent(leftValue: '5'),
        CalculatorState.initial().copyWith.ent(leftValue: '5', rightValue: '3'),
        CalculatorState.initial().copyWith.ent(
            leftValue: '5', rightValue: '3', type: const CalculatorType.add()),
        predicate<CalculatorState>((state) =>
            state.ent.value == 8 &&
            state.ent.histories.length == 1 &&
            state.isValid == true),
      ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'emits error state when submit is called with empty input',
      build: () => calculatorCubit,
      act: (cubit) {
        cubit.chooseType(const CalculatorType.add());
        cubit.submit();
      },
      expect: () => [
        CalculatorState.initial()
            .copyWith
            .ent(type: const CalculatorType.add()),
        CalculatorState.initial().copyWith(
          ent: CalculatorState.initial()
              .ent
              .copyWith(type: const CalculatorType.add()),
          showError: true,
        ),
      ],
    );

    blocTest<CalculatorCubit, CalculatorState>(
      'restores history correctly',
      build: () => calculatorCubit,
      act: (cubit) {
        final historyEntity = HistoryEntity.newEntity(
          leftValue: '10',
          rightValue: '2',
          type: const CalculatorType.multiply(),
        );
        cubit.restoreHistory(historyEntity);
      },
      expect: () => [
        predicate<CalculatorState>((state) =>
            state.ent.leftValue == '10' &&
            state.ent.rightValue == '2' &&
            state.ent.type == const CalculatorType.multiply()),
      ],
    );

    test('displayValue returns correct value', () {
      calculatorCubit.emit(calculatorCubit.state.copyWith(
        ent: calculatorCubit.state.ent.copyWith(value: 15.5),
        isValid: true,
      ));
      expect(calculatorCubit.state.displayValue, '15.5');
    });

    test('equationText returns correct symbol', () {
      expect(
          calculatorCubit.state.equationText(const CalculatorType.add()), '+');
      expect(
          calculatorCubit.state.equationText(const CalculatorType.substract()),
          '-');
      expect(
          calculatorCubit.state.equationText(const CalculatorType.multiply()),
          '*');
      expect(calculatorCubit.state.equationText(const CalculatorType.divide()),
          '/');
      expect(
          calculatorCubit.state.equationText(const CalculatorType.pow()), '^');
    });

    test('showErrorMsg returns correct value', () {
      calculatorCubit.emit(calculatorCubit.state.copyWith(showError: true));
      expect(calculatorCubit.state.showErrorMsg, isNotNull);

      calculatorCubit.emit(calculatorCubit.state.copyWith(showError: false));
      expect(calculatorCubit.state.showErrorMsg, isNull);
    });

    test('isError returns correct value', () {
      calculatorCubit.emit(calculatorCubit.state.copyWith(showError: true));
      expect(calculatorCubit.state.isError, isFalse);

      calculatorCubit.emit(calculatorCubit.state.copyWith(showError: false));
      expect(calculatorCubit.state.isError, isTrue);
    });

    test('isDivide returns correct value', () {
      calculatorCubit.chooseType(const CalculatorType.divide());
      expect(calculatorCubit.state.isDivide, isTrue);

      calculatorCubit.chooseType(const CalculatorType.add());
      expect(calculatorCubit.state.isDivide, isFalse);
    });
  });
}
