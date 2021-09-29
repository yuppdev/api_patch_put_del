import 'package:api_patch_put_del/models/todo.dart';

abstract class Repository {
  Future<List<Todo>> getTodoList();
  Future<String> patchCompleted(Todo todo);
  Future<String> putCompleted(Todo todo);
  Future<String> deletedTodo(Todo todo);
  Future<String> postTodo(Todo todo);
}