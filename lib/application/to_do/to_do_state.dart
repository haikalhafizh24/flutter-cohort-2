part of 'to_do_cubit.dart';

@freezed
class ToDoState with _$ToDoState {
  const ToDoState._();

  const factory ToDoState({
    required ToDoEntity entity,
    required bool showError,
  }) = _ToDoState;

  factory ToDoState.initial() => ToDoState(
        entity: ToDoEntity.empty(),
        showError: false,
      );

  bool choosenType(ToDoHistoryType type) {
    return type == entity.type;
  }

  ToDoState get unmodified => copyWith(entity: entity.copyWith(id: 0));

  bool get isError =>
      showDescriptionErrorMsg == null && showTitleErrorMsg == null;

  bool get newToDo => entity.id == 0;

  bool isEdited(id) => id == entity.id;

  String get ctaText => newToDo ? 'Save' : 'Update';

  String? get showTitleErrorMsg => showError ? entity.titleErrorMsg : null;

  String? get showDescriptionErrorMsg =>
      showError ? entity.descriptionErrorMsg : null;

  // get histories list

  List<ToDoHistoryEntity> get histories => entity.type.when(
        all: () => entity.histories,
        done: () =>
            entity.histories.where((element) => element.isDone).toList(),
        notDone: () =>
            entity.histories.where((element) => !element.isDone).toList(),
      );
}
