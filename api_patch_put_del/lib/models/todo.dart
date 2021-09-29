class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo({this.userId, this.id, this.title, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> obj = Map<String, dynamic>();
    obj['userId'] = userId.toString();
    obj['id'] = id.toString();
    obj['title'] = title;
    obj['completed'] = completed.toString();
    return obj;
  }
}
