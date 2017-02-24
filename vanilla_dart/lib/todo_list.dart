import 'dart:html';
import 'dart:convert';
import 'todo.dart';
import 'todo_card.dart';

class TodoList {
  List<Todo> _todoList = [];

  Iterable<TodoCard> get _todoCards =>
      _todoList.map((Todo todo) => new TodoCard(todo));

  List<Todo> get todoList => _todoList;

  HtmlElement _element;

  HtmlElement get element => _element;

  TodoList.fromJson(String json) {
    List<Map<String, dynamic>> list = JSON.decode(json);
    for (Map<String, dynamic> todo in list) {
      _todoList.add(new Todo.fromMap(todo));
    }
    _build();
  }

  TodoList() {
    _build();
  }

  void _build() {
    _element = new Element.html('<div class="todo-list"></div>');

    for (TodoCard todo in _todoCards) {
      _element.append(todo.element);
    }
  }

  void addTodo(Todo todo) {
    _todoList.add(todo);
    _element.append(new TodoCard(todo).element);
  }

  List<Map<String, dynamic>> toListMap() =>
      _todoList.map((Todo todo) => todo.toMap()).toList();
}
