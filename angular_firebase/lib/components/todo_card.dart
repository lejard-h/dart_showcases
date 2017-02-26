import 'package:angular2/core.dart';
import 'package:angular_firebase/model/todo.dart';
import 'package:angular_firebase/services/todo.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(selector: 'todo-card', templateUrl: 'todo_card.html', directives: const [materialDirectives])
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

}
