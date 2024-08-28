import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:student_lecture_app/application/to_do/to_do_cubit.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage hydratedStorage;

  setUp(() {
    hydratedStorage = MockStorage();
    when(() => hydratedStorage.write(any(), any<dynamic>()))
        .thenAnswer((_) async {});
    HydratedBloc.storage = hydratedStorage;
  });
  group('ToDoCubit', () {
    ToDoCubit? toDoCubit;

    setUp(() {
      toDoCubit = ToDoCubit();
    });

    tearDown(() {
      toDoCubit?.close();
    });

    test('initial state is correct', () {
      expect(toDoCubit?.state, ToDoState.initial());
    });

    blocTest<ToDoCubit, ToDoState>(
      'emits new state when inputText is called',
      build: () => ToDoCubit(),
      act: (cubit) => cubit.inputText('New ToDo'),
      expect: () => [
        ToDoState.initial().copyWith.entity(description: 'New ToDo'),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits new states when saveTextToHistories is called',
      build: () => ToDoCubit(),
      act: (cubit) {
        cubit.descriptionController.text = 'New ToDo';
        cubit.saveTextToHistories();
      },
      expect: () => [
        isA<ToDoState>()
            .having((s) => s.entity.description, 'description', 'New ToDo')
            .having((s) => s.entity.histories, 'histories', isEmpty)
            .having((s) => s.showError, 'showError', false),
        isA<ToDoState>()
            .having((s) => s.entity.description, 'description', 'New ToDo')
            .having((s) => s.entity.histories.length, 'histories length', 1)
            .having((s) => s.entity.histories.first.description,
                'first history item description', 'New ToDo')
            .having((s) => s.showError, 'showError', false),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits new state when changeType is called',
      build: () => ToDoCubit(),
      act: (cubit) => cubit.changeType(const ToDoHistoryType.done()),
      expect: () => [
        ToDoState.initial().copyWith.entity(type: const ToDoHistoryType.done()),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits new state when updateToDoStatus is called',
      build: () => ToDoCubit(),
      seed: () => ToDoState.initial().copyWith.entity(
        histories: [
          ToDoHistoryEntity(id: 1, description: 'Test', isDone: false),
        ],
      ),
      act: (cubit) => cubit.updateToDoStatus(isDone: true, id: 1),
      expect: () => [
        ToDoState.initial().copyWith.entity(
          histories: [
            ToDoHistoryEntity(id: 1, description: 'Test', isDone: true),
          ],
        ),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits error state when save is called with empty description',
      build: () => ToDoCubit(),
      act: (cubit) => cubit.save(),
      expect: () => [
        ToDoState.initial().copyWith(showError: true),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits new state when editToDo is called',
      build: () => ToDoCubit(),
      act: (cubit) => cubit.editToDo(
        ToDoHistoryEntity(id: 1, description: 'Edited ToDo', isDone: false),
      ),
      expect: () => [
        ToDoState.initial().copyWith.entity(
              description: 'Edited ToDo',
              id: 1,
            ),
      ],
    );

    blocTest<ToDoCubit, ToDoState>(
      'emits new state when removeToDo is called',
      build: () => ToDoCubit(),
      seed: () => ToDoState.initial().copyWith.entity(
        histories: [
          ToDoHistoryEntity(id: 1, description: 'Test', isDone: false),
        ],
      ),
      act: (cubit) => cubit.removeToDo(
        ToDoHistoryEntity(id: 1, description: 'Test', isDone: false),
      ),
      expect: () => [
        ToDoState.initial().copyWith.entity(
          histories: [],
        ),
      ],
    );
  });
}
