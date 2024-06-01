import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_app/features/models/todo.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

const _uuid = Uuid();

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  List<Todo> build() {
    return [
      Todo(
        isCompleted: true,
        name: 'Training at the Gym',
        id: _uuid.v4(),
      ),
      Todo(
        isCompleted: false,
        name: 'Play Paddle with friends',
        id: _uuid.v4(),
      ),
      Todo(
        isCompleted: false,
        name: 'Burger BBQ with family',
        id: _uuid.v4(),
      ),
    ];
  }

  void add(String name) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        name: name,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            isCompleted: !todo.isCompleted,
            name: todo.name,
          )
        else
          todo,
    ];
  }

  void edit(String id, String name) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            isCompleted: todo.isCompleted,
            name: name,
          )
        else
          todo,
    ];
  }
}
