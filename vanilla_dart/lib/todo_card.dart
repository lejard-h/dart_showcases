import 'dart:html';

import 'todo.dart';

typedef void TodoAction(Todo todo);

class TodoCard {
  HtmlElement _element;
  HtmlElement get element => _element;
  final TodoAction onCancel;
  final TodoAction onDone;

  final Todo todo;

  TodoCard(this.todo, this.onDone, this.onCancel) {
    _build();
  }

  HtmlElement get _titleBuilder =>
      new Element.html('<div class="mdl-card__title">'
          '<h2 class="mdl-card__title-text">${todo.title}</h2>'
          '</div>');

  HtmlElement get _contentBuilder => new Element.html(
      '<div class="mdl-card__supporting-text">${todo.content ?? ''}</div>');

  HtmlElement get _actions {
    AnchorElement buttonDone = new Element.html(
        '<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Done</a>')
      ..onClick.listen((_) {
        _element.classes.remove(todo.status);
        todo.status = Todo.statusDone;
        _element.classes.add(todo.status);
        if (onDone != null) {
          onDone(todo);
        }
      });

    AnchorElement buttonCancel = new Element.html(
        '<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Cancel</a>')
      ..onClick.listen((_) {
        _element.classes.remove(todo.status);
        todo.status = Todo.statusCanceled;
        _element.classes.add(todo.status);
        if (onCancel != null) {
          onCancel(todo);
        }
      });

    return new Element.html(
        '<div class="mdl-card__actions mdl-card--border"></div>')
      ..append(buttonDone)
      ..append(buttonCancel);
  }

  void _build() {
    _element = new Element.html(
        '<div class="mdl-card mdl-shadow--2dp ${todo.status} fadeInLeft animated"></div>')
      ..append(_titleBuilder)
      ..append(_contentBuilder)
      ..append(_actions);
  }
}
