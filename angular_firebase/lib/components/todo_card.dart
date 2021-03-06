import 'package:angular2/core.dart';
import 'package:shared/models.dart';
import 'package:angular_firebase/services/todo.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

@Component(selector: 'todo-card', templateUrl: 'todo_card.html', directives: const [materialDirectives, FA_DIRECTIVES])
class TodoCard {

    TodoService _todoService;

    TodoCard(this._todoService);

    @Input()
    Todo todo;

    void onDone() {
        todo.status = Todo.statusDone;
        _todoService.update(todo);
    }

    void onCanceled() {
        todo.status = Todo.statusCanceled;
        _todoService.update(todo);
    }

    void onDelete() {
        _todoService.delete(todo.id);
    }

}
