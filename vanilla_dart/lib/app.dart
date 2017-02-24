import 'dart:html';
import 'dart:convert';
import 'todo.dart';
import 'todo_list.dart';

class App {
  HtmlElement _rootElement;
  TodoList _list;
  final String _storageKey = "todo_storage";

  App() {
    _rootElement = querySelector(".page-content");
    _list = window.localStorage.containsKey(_storageKey)
        ? new TodoList.fromJson(window.localStorage[_storageKey])
        : new TodoList();
    _rootElement.append(_list.element);
  }

  void addTodo(Todo todo) {
    _list.addTodo(todo);
    window.localStorage[_storageKey] = JSON.encode(_list.toListMap());
  }
}
