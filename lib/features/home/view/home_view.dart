import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_app/core/config/router.dart';
import 'package:to_do_app/core/extensions/context_extensions.dart';
import 'package:to_do_app/features/providers/todo_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 123,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.theme.colorScheme.onPrimary,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Egemen'),
                Text('egemenongel@gmail.com'),
              ],
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: _Todos(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => unawaited(
          const AddTodoRoute().push(context),
        ),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _Todos extends ConsumerWidget {
  const _Todos();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNotifierProvider);
    return Column(
      children: todos
          .map(
            (e) => SizedBox(
              height: 91,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(19),
                  child: Row(
                    children: [
                      Checkbox(
                        value: e.isCompleted,
                        onChanged: (value) => ref
                            .read(todoNotifierProvider.notifier)
                            .toggle(e.id!),
                      ),
                      Text(
                        e.name!,
                        style: TextStyle(
                          decoration:
                              e.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Edit'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
