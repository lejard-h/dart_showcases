import 'dart:html';
import 'dart:async';
import 'todo.dart';

class Dialog {
  DialogElement _dialog;
  Completer<dynamic> _responseCompleter;
  FormElement _form;
  InputElement _inputTitle;
  TextAreaElement _inputContent;

  Dialog() {
    _dialog = querySelector("dialog");
    _form = querySelector("#todo-form");
    _inputTitle = querySelector("#title");
    _inputContent = querySelector("#content");
    _setDialogEvents();
  }

  void _setDialogEvents() {
    _dialog.querySelector(".mdl-button.agree").onClick.listen((_) {
      if (_form.checkValidity()) {
        _close(new Todo(_inputTitle.value, _inputContent.value ?? ""));
        _dialog.close(null);
      }
    });

    _dialog.querySelector(".mdl-button.close").onClick.listen((_) {
      _dialog.close(null);
      _close(null);
    });
  }

  void _close([response]) {
    if (_responseCompleter?.isCompleted == false) {
      _responseCompleter.complete(response);
    }
  }

  void clearForm() {
    _inputTitle.value = '';
    _inputContent.value = '';
  }

  Future<dynamic> show() {
    _responseCompleter = new Completer<dynamic>();
    clearForm();
    _dialog.showModal();
    return _responseCompleter.future;
  }
}
