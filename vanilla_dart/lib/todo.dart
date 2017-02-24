import 'dart:convert';

class Todo {
  String title;
  String content;
  String status;

  static const String titleKey = "title";
  static const String contentKey = "content";
  static const String statusKey = "status";

  static const String statusPending = "pending";
  static const String statusDone = "done";
  static const String statusCanceled = "canceled";

  Todo(this.title, this.content, {this.status = statusPending});

  factory Todo.fromJson(String json) => new Todo.fromMap(JSON.decode(json));

  factory Todo.fromMap(Map map) =>
      new Todo(map[titleKey], map[contentKey], status: map[statusKey]);

  Map<String, dynamic> toMap() =>
      {titleKey: title, contentKey: content, statusKey: status};
}
