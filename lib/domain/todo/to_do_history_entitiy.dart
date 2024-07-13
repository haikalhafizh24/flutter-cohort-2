import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_history_entitiy.freezed.dart';
part 'to_do_history_entitiy.g.dart';

@freezed
class ToDoHistoryEntity with _$ToDoHistoryEntity {
  const ToDoHistoryEntity._();

  factory ToDoHistoryEntity({
    required int id,
    // required String title,
    required String description,
    required bool isDone,
  }) = _ToDoHistoryEntity;

  factory ToDoHistoryEntity.newEntity({
    // required String title,
    required String description,
  }) =>
      ToDoHistoryEntity(
        id: Random().nextInt(1000),
        // title: title,
        description: description,
        isDone: false,
      );

  factory ToDoHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoHistoryEntityFromJson(json);
}

@freezed
class ToDoHistoryType with _$ToDoHistoryType {
  const factory ToDoHistoryType.all() = _All;
  const factory ToDoHistoryType.done() = _Done;
  const factory ToDoHistoryType.notDone() = _NotDone;

  factory ToDoHistoryType.fromJson(Map<String, dynamic> json) =>
      _$ToDoHistoryTypeFromJson(json);
}
