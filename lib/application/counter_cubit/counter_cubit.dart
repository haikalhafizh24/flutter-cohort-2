import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/counter/counter_entity.dart';

part 'counter_cubit.freezed.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(
      state.copyWith(ent: state.ent.increment),
    );
  }

  void decrement() {
    emit(
      state.copyWith(ent: state.ent.decrement),
    );
  }
}
