import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/calculator/calculator_entity.dart';

part 'history_entity.freezed.dart';

@freezed
class HistoryEntity with _$HistoryEntity {
  const HistoryEntity._();

  factory HistoryEntity({
    required int id,
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
  }) = _HistoryEntity;

  factory HistoryEntity.newEntity({
    required String leftValue,
    required String rightValue,
    required CalculatorType type,
  }) =>
      HistoryEntity(
        id: Random().nextInt(1000),
        leftValue: leftValue,
        rightValue: rightValue,
        type: type,
      );
}
