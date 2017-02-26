import 'dart:html';
import 'package:shared/models.dart';
import 'todo_card.dart';

class TodoList {
  List<Todo> _todoList = [];
  final TodoAction onCancel;
  final TodoAction onDone;

  Iterable<TodoCard> get _todoCards =>
      _todoList.map((Todo todo) => new TodoCard(todo, onDone, onCancel));

  List<Todo> get todoList => _todoList;

  HtmlElement _element;

  HtmlElement get element => _element;

  TodoList.fromJson(String json, this.onDone, this.onCancel) {
    _todoList = jsonSerializer.from(json, type: Todo) as List<Todo>;
    _build();
  }

  TodoList(this.onDone, this.onCancel) {
    _build();
  }

  void _build() {
    _element = new Element.html('<div class="todo-list"></div>');
    Iterable<TodoCard> cards = _todoCards;
    for (TodoCard todo in cards) {
      _element.append(todo.element);
    }
  }

  void addTodo(Todo todo) {
    _todoList.add(todo);
    TodoCard card = new TodoCard(todo, onDone, onCancel);
    _element.append(card.element);
  }

  String toJson() => jsonSerializer.to(_todoList);
}
