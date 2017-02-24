import 'dart:html';

import 'todo.dart';

class TodoCard {
  HtmlElement _element;
  HtmlElement get element => _element;

  final Todo todo;

  TodoCard(this.todo) {
    _build();
  }

  HtmlElement get _titleBuilder =>
      new Element.html('<div class="mdl-card__title">'
          '<h2 class="mdl-card__title-text">${todo.title}</h2>'
          '</div>');

  HtmlElement get _contentBuilder => new Element.html(
      '<div class="mdl-card__supporting-text">${todo.content ?? ''}</div>');

  HtmlElement get _actions {
    AnchorElement button = new Element.html(
        '<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Get Started</a>')
      ..onClick.listen((_) {
        window.alert("click button");
      });

    return new Element.html(
        '<div class="mdl-card__actions mdl-card--border"></div>')
      ..append(button);
  }

  void _build() {
    _element = new Element.html(
        '<div class="mdl-card mdl-shadow--2dp ${todo.status}"></div>')
      ..append(_titleBuilder)
      ..append(_contentBuilder)
      ..append(_actions);
  }
}
