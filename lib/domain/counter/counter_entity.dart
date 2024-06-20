// Create entity if cubit need more than 1 validation

import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_entity.freezed.dart';

@freezed
class CounterEntity with _$CounterEntity {
  const CounterEntity._();
  // initialize in class

  const factory CounterEntity({
    required int counterText,
  }) = _CounterEntity;

  factory CounterEntity.empty() => const CounterEntity(counterText: 0);
  // initialize counter value to 0

  CounterEntity get increment {
    return CounterEntity(counterText: counterText + 1);
  }

  CounterEntity get decrement {
    if (counterText < 1) {
      return CounterEntity(counterText: counterText);
      // validation to return default value of counter if counter less than 1
    }
    return CounterEntity(counterText: counterText - 1);
  }
}
