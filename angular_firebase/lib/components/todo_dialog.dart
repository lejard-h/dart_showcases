import 'package:angular2/core.dart';
import 'package:angular_firebase/services/todo.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular_firebase/model/todo.dart';

@Component(selector: 'todo-dialog', templateUrl: 'todo_dialog.html', directives: const [materialDirectives])
class TodoDialog {
  Todo todo;
  bool showDialog = false;
  TodoService _todoService;

  TodoDialog(this._todoService);

  void onSubmit() {
    _todoService.create(todo);
    hide();
  }

  void show() {
    todo = new Todo("", "");
    showDialog = true;
  }

  void hide() {
    showDialog = false;
    todo = null;
  }
}
