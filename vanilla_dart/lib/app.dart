import 'dart:html';
import 'package:shared/models.dart';
import 'todo_list.dart';

class App {
  HtmlElement _rootElement;
  CheckboxInputElement _checkBoxDone;
  CheckboxInputElement _checkBoxCanceled;
  TodoList _list;
  final String _storageKey = "todo_storage";

  App() {
    _rootElement = querySelector(".page-content");
    _checkBoxCanceled = querySelector("#checkbox-canceled");
    _checkBoxDone = querySelector("#checkbox-done");
    _checkBoxCanceled.onChange.listen((_) {
      _rootElement.classes.toggle("canceled-checked");
    });
    _checkBoxDone.onChange.listen((_) {
      _rootElement.classes.toggle("done-checked");
    });
    _list = window.localStorage.containsKey(_storageKey)
        ? new TodoList.fromJson(
            window.localStorage[_storageKey], _onAction, _onAction)
        : new TodoList(_onAction, _onAction);
    _rootElement.append(_list.element);
  }

  void _onAction(Todo todo) {
    window.localStorage[_storageKey] = _list.toJson();
  }

  void addTodo(Todo todo) {
    _list.addTodo(todo);
    window.localStorage[_storageKey] = _list.toJson();
  }
}
