import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    final String? id,
    final String? name,
    @Default(false) final bool isCompleted,
  }) = _Todo;
}
