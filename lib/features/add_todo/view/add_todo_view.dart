import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_app/core/components/primary_elevated_button.dart';
import 'package:to_do_app/core/components/primary_text_field.dart';
import 'package:to_do_app/core/extensions/context_extensions.dart';
import 'package:to_do_app/features/providers/todo_provider.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: const _Form(),
    );
  }
}

class _Form extends HookConsumerWidget {
  const _Form();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final name = useTextEditingController();
    return Form(
      key: formKey,
      child: Padding(
        padding: context.paddingHorizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const _Header(),
            const SizedBox(height: 15),
            _NameField(name: name),
            const Spacer(),
            _DoneButton(formKey: formKey, name: name)
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Task Name',
      style: context.textTheme.displayLarge,
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.name,
  });

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      controller: name,
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please fill this field' : null,
    );
  }
}

class _DoneButton extends ConsumerWidget {
  const _DoneButton({
    required this.formKey,
    required this.name,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: PrimaryElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ref.read(todoNotifierProvider.notifier).add(name.text);
            context.pop();
          }
        },
        child: const Text(
          'Done',
          style: TextStyle(
            shadows: [
              Shadow(
                offset: Offset(0.0, 2.0), // Position of the shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
