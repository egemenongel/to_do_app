import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_app/core/config/router.dart';
import 'package:to_do_app/core/constants/constants.dart';
import 'package:to_do_app/core/extensions/context_extensions.dart';
import 'package:to_do_app/features/home/view/widgets/premium_banner.dart';
import 'package:to_do_app/features/home/view/widgets/todo_card.dart';
import 'package:to_do_app/features/providers/todo_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 2 * kToolbarHeight,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.theme.colorScheme.onPrimary,
              child: Image.asset(R.avatar),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, EGEMEN',
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    'egemenongel@gmail.com',
                    style: context.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PremiumBanner(),
            SizedBox(height: 20),
            _Todos(),
          ],
        ),
      ),
      floatingActionButton: const _AddButton(),
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
            (todo) => TodoCard(todo: todo),
          )
          .toList(),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => unawaited(
        const AddTodoRoute().push(context),
      ),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
