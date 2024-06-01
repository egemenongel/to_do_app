import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_app/core/config/router.dart';
import 'package:to_do_app/core/extensions/context_extensions.dart';
import 'package:to_do_app/features/models/todo.dart';
import 'package:to_do_app/features/providers/todo_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
      child: SizedBox(
        height: 100,
        child: Card(
          shadowColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
              border: Border.all(
                color: const Color(0xffe7e7e7),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                _Checkbox(todo: todo),
                _Name(todo: todo),
                const Spacer(),
                _EditButton(todo: todo)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Checkbox extends ConsumerWidget {
  const _Checkbox({
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        shape: const CircleBorder(
          side: BorderSide(),
        ),
        side: BorderSide(
          color: todo.isCompleted
              ? const Color(0xff49C25D)
              : const Color(0xff071d55),
          width: 1,
          style: BorderStyle.solid,
        ),
        checkColor: const Color(0xff399649),
        fillColor: WidgetStatePropertyAll(
          todo.isCompleted ? const Color(0xff53da69) : Colors.white,
        ),
        value: todo.isCompleted,
        onChanged: (value) =>
            ref.read(todoNotifierProvider.notifier).toggle(todo.id!),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Text(
      todo.name!,
      style: todo.isCompleted
          ? context.textTheme.displaySmall
          : context.textTheme.displayMedium,
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: OutlinedButton(
        onPressed: () => unawaited(
          EditTodoRoute(id: todo.id!).push(context),
        ),
        child: const Text('Edit'),
      ),
    );
  }
}
