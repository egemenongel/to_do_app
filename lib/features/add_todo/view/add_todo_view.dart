import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        padding: context.padding8,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Color(0xff0d2972)),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcbcbcb)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcbcbcb)),
                ),
              ),
              controller: name,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please fill this field'
                  : null,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(todoNotifierProvider.notifier).add(name.text);
                    context.pop();
                  }
                },
                child: const Text(
                  'Done',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
