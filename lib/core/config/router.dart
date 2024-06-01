import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_app/features/add_todo/view/add_todo_view.dart';
import 'package:to_do_app/features/edit_todo/view/edit_todo_view.dart';
import 'package:to_do_app/features/home/view/home_view.dart';
import 'package:to_do_app/features/not_found_view.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    errorBuilder: (_, state) => const NotFoundView(),
  );
}

@TypedGoRoute<HomeRoute>(path: '/', name: 'home')
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeView();
}

@TypedGoRoute<AddTodoRoute>(path: '/addTodo', name: 'addTodo')
class AddTodoRoute extends GoRouteData {
  const AddTodoRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AddTodoView();
}

@TypedGoRoute<EditTodoRoute>(path: '/editTodo', name: 'editTodo')
class EditTodoRoute extends GoRouteData {
  const EditTodoRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EditTodoView();
}
