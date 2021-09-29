import 'dart:convert';

import 'package:api_patch_put_del/models/todo.dart';
import 'package:api_patch_put_del/repository/repository.dart';
import 'package:http/http.dart' as http;

class TodoRepository implements Repository {

  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<String> deletedTodo(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Todo>> getTodoList() async{
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    // print('status code: ${response.statusCode}');
    var body = json.decode(response.body);
    for(var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    // bool? -> String
    await http.patch(
      url,
      body: {
      'complete' : (!todo.completed!).toString()
      },
      headers: {'Authorization' : 'your_token'},
    ).then((response) {
      // homeScreen -> data
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'].toString();
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    print('${todo.toJson()}');
    var url = Uri.parse('$dataURL/todos/');
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'complete' : (!todo.completed!).toString()
      },
      headers: {'Authorization' : 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'].toString();
    });
    return resData;
  }
  
}