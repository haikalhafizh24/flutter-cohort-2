// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/domain/core/form_failure.dart';
import 'package:student_lecture_app/domain/core/form_validator.dart';
import 'package:student_lecture_app/domain/todo/to_do_history_entitiy.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
class ToDoEntity with _$ToDoEntity {
  const ToDoEntity._();

  const factory ToDoEntity({
    required int id,
    required String title,
    required String description,
    required bool isDone,
    required List<ToDoHistoryEntity> histories,
    required ToDoHistoryType type,
  }) = _ToDoEntity;

  factory ToDoEntity.empty() => const ToDoEntity(
      id: 0,
      title: '',
      description: '',
      isDone: false,
      histories: [],
      type: ToDoHistoryType.all());

  Option<FormFailure> get failureOption {
    return FormValidator.emptyValidator(title)
        .andThen(() => FormValidator.emptyValidator(description))
        .andThen(() =>
            FormValidator.customValidator(validator: _cannotAddTheSameText))
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }

  Either<String, Unit> get _todoEmptyDescriptionErrorMsg {
    return FormValidator.emptyValidator(description).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Description cannot be empty'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _todoEmptyTitleErrorMsg {
    return FormValidator.emptyValidator(title).fold(
      (failure) => failure.maybeWhen(
        orElse: () => right(unit),
        empty: () => left('Title cannot be empty'),
      ),
      (_) => right(unit),
    );
  }

  Either<String, Unit> get _todoRedundantErrorMsg {
    return FormValidator.customValidator(validator: _cannotAddTheSameText).fold(
      (failure) => failure.maybeWhen(
          orElse: () => right(unit),
          costumError: () => left('To do already exist')),
      (_) => right(unit),
    );
  }

  String? get descriptionErrorMsg {
    return _todoEmptyDescriptionErrorMsg.fold(
      (error) => error,
      (valid) => _todoRedundantErrorMsg.fold(
        (error) => error,
        (valid) => null,
      ),
    );
  }

  String? get titleErrorMsg {
    return _todoEmptyTitleErrorMsg.fold(
      (error) => error,
      (valid) => _todoRedundantErrorMsg.fold(
        (error) => error,
        (valid) => null,
      ),
    );
  }

  bool get _cannotAddTheSameText {
    final isTitleRedundant = histories
        .any((element) => element.title.toLowerCase() == title.toLowerCase());
    final isDescriptionRedundant = histories.any((element) =>
        element.description.toLowerCase() == description.toLowerCase());

    final isRedundant = isTitleRedundant && isDescriptionRedundant;
    return isRedundant;
  }

  List<ToDoHistoryEntity> removeToDoHistory(ToDoHistoryEntity entity) {
    final newHistories = [...histories];
    // menghapus histori sesuai dengan index model yang dipilih
    newHistories.removeWhere((element) => element == entity);

    return newHistories;
  }

  List<ToDoHistoryEntity> get newHistories {
    final newHistory = ToDoHistoryEntity.newEntity(
      title: title,
      description: description,
    );
    final newHistories = [...histories, newHistory];
    // ...histories (spread Operator) berfungsi untuk duplikasi list sebelumnya agar tidak hilang ke dalam list yang baru
    return newHistories;
  }

  List<ToDoHistoryEntity> updateHistories({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    final newHistories = [...histories];

    //memeriksa apakah dalam list history ada id yang sama
    final index = newHistories.indexWhere((element) => element.id == id);

    // final index = newHistories.indexOf(newEntity);

    // jika ada index yang sama, maka akan diperiksa parameter apa saja yang berubah pada index yang sama,
    if (index != -1) {
      newHistories[index] = newHistories[index].copyWith(
        // jika deskripisi tidak diubah, maka tetap menggunakan deskripsi yang sama
        description: description ?? newHistories[index].description,
        // jika judul tidak diubah, maka tetap menggunakan judul yang sama
        title: title ?? newHistories[index].title,

        // jika checklist diubah, maka akan mengubah checklist id yang lama sesuai dengan checklist yang baru
        isDone: isDone ?? newHistories[index].isDone,
      );
    }

    return newHistories;
  }

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);
}
