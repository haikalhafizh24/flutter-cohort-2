import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/calculator/history_entity.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';

part 'calculator_entity.freezed.dart';

@freezed
class CalculatorEntity with _$CalculatorEntity {
  const CalculatorEntity._();

  factory CalculatorEntity({
    required double value,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
    required List<HistoryEntity> histories,
  }) = _CalculatorEntity;

  factory CalculatorEntity.empty() => CalculatorEntity(
        value: 0,
        leftValue: "",
        rightValue: "",
        type: const CalculatorType.none(),
        histories: [],
      );

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(leftValue)
        .andThen(() => FormValidator.emptyValidator(rightValue))
        .fold((failure) => some(failure), (_) => none());
  }

  Either<String, Unit> get _emptyLeftErrorMsg {
    return FormValidator.emptyValidator(leftValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Left form must not be empy'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _emptyRightErrorMsg {
    return FormValidator.emptyValidator(rightValue).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Left form must not be empy'),
        zero: () => type == const CalculatorType.divide()
            ? left('Cannot be divided by zero')
            : right(unit),
      ),
      (_) => right(unit),
    );
  }

  String? get textErrorMsg {
    return _emptyLeftErrorMsg
        .andThen(() => _emptyRightErrorMsg)
        .fold((errorMsg) => errorMsg, (_) => null);
  }

// memeriksa apakah ada nilai yang sama pada history, jika ada maka tidak menambahkan perhitungan yang sama kedalam history
  bool get _isAlreadyAddedinHistories {
    final newHistories = [...histories];

    final isFound = newHistories.any(
      (element) =>
          element.leftValue == leftValue && element.rightValue == rightValue,
    );
    return isFound;
  }

// menambahkan perhitungan kedalam history
  List<HistoryEntity> get newHistory {
    final newEnt = HistoryEntity.newEntity(
      leftValue: leftValue,
      rightValue: rightValue,
      type: type,
    );

    if (!_isAlreadyAddedinHistories) {
      final newHistories = [
        ...histories,
        newEnt
      ]; //memasukkan perhitungan kedalam list histories
      return newHistories;
    }
    return histories;
  }

  List<HistoryEntity> removeHistory(HistoryEntity ent) {
    final newHistories = [...histories];

    newHistories.removeWhere((element) => element == ent);

    return newHistories;
  }

// menghilangkan 0 dibelakang koma
  String get convertValue {
    RegExp regex = RegExp(r'([.]*0)*(?!.*\d)');

    final valueSplited = value.toString().split('.');

    if (valueSplited[1].length == 1) {
      return value.toString().replaceAll(regex, '');
    }

    return value.toStringAsFixed(2).replaceAll(regex, '');
  }

// perhitungan

  double get addMethod {
    return double.parse(leftValue) + double.parse(rightValue);
  }

  double get substractMethod {
    return double.parse(leftValue) - double.parse(rightValue);
  }

  double get multiplyMethod {
    return double.parse(leftValue) * double.parse(rightValue);
  }

  double get divideMethod {
    return double.parse(leftValue) / double.parse(rightValue);
  }

  double get powMethod {
    return pow(double.parse(leftValue), double.parse(rightValue)).toDouble();
  }
}

@freezed
class CalculatorType with _$CalculatorType {
  const factory CalculatorType.none() = _None;
  const factory CalculatorType.add() = _Add;
  const factory CalculatorType.substract() = _Substract;
  const factory CalculatorType.multiply() = _Multiply;
  const factory CalculatorType.divide() = _Divide;
  const factory CalculatorType.pow() = _Pow;
}
