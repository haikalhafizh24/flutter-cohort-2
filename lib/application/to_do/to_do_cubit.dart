import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:student_lecture_app/domain/todo/to_do_entity.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart';

part 'to_do_cubit.freezed.dart';
part 'to_do_state.dart';

// use HydratedCubit
class ToDoCubit extends HydratedCubit<ToDoState> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  ToDoCubit() : super(ToDoState.initial()) {
    titleController = TextEditingController()
      ..addListener(onTitleControllerChange);
    descriptionController = TextEditingController()
      ..addListener(onDescriptionControllerChange);
  }

  void onTitleControllerChange() {
    inputTitle(titleController.text);
  }

  // untuk memasukkan textcontroller
  void onDescriptionControllerChange() {
    inputDescription(descriptionController.text);
  }

  void inputTitle(String val) {
    emit(state.copyWith.entity(title: val));
  }

  void inputDescription(String val) {
    emit(state.copyWith.entity(description: val));
  }

  void changeType(ToDoHistoryType type) {
    emit(state.copyWith.entity(type: type));
  }

  void updateToDoStatus({
    required bool isDone,
    required int id,
  }) {
    emit(state.copyWith.entity(
        histories: state.entity.updateHistories(
      isDone: isDone,
      id: id,
    )));
  }

  void saveTextToHistories() {
    emit(state.unmodified.copyWith(showError: false).copyWith.entity(
          histories: state.entity.newHistories,
          title: titleController.text,
          description: descriptionController.text,
        ));
  }

  void updateTextToHistories() {
    final updatedHistories = state.entity.updateHistories(
      title: titleController.text,
      description: descriptionController.text,
      id: state.entity.id,
    );

    emit(state.unmodified.copyWith(showError: false).copyWith.entity(
          histories: updatedHistories,
          title: titleController.text,
          description: descriptionController.text,
        ));
  }

  void resetState() {
    titleController.clear();
    descriptionController.clear();
    emit(ToDoState.initial());
  }

  void save() {
    state.entity.failureOption.fold(() {
      if (state.newToDo) {
        saveTextToHistories();
      } else {
        updateTextToHistories();
      }
      titleController.clear();
      descriptionController.clear();
      emit(state.copyWith(showError: false));
    }, (failure) {
      emit(state.copyWith(showError: true));
    });
  }

  void editToDo(ToDoHistoryEntity entity) {
    titleController.removeListener(onTitleControllerChange);
    titleController.value = TextEditingValue(text: entity.title);
    titleController.addListener(onTitleControllerChange);

    descriptionController.removeListener(onDescriptionControllerChange);
    descriptionController.value = TextEditingValue(text: entity.description);
    descriptionController.addListener(onDescriptionControllerChange);
    emit(
      state.unmodified.copyWith.entity(
        title: entity.title,
        description: entity.description,
        id: entity.id,
      ),
    );
  }

  void removeToDo(ToDoHistoryEntity entity) {
    emit(state.unmodified.copyWith.entity(
      histories: state.entity.removeToDoHistory(entity),
    ));
  }

// load data from json
  @override
  ToDoState? fromJson(Map<String, dynamic> json) {
    return ToDoState(
      entity: ToDoEntity.fromJson(json),
      showError: false,
    );
  }

// save data to json
  @override
  Map<String, dynamic>? toJson(ToDoState state) {
    return state.entity.toJson();
  }
}
