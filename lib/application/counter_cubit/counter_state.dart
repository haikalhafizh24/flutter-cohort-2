part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const CounterState._();

  const factory CounterState({
    required CounterEntity ent,
  }) = _CounterState;

  factory CounterState.initial() => CounterState(ent: CounterEntity.empty());
}
