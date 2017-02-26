import 'package:angular2/core.dart';
import 'package:angular_firebase/services/todo.dart';
import 'package:angular_firebase/services/checkbox_filter.dart';
import 'package:angular_firebase/model/todo.dart';
import 'todo_card.dart';


@Component(
    selector: 'todo-list', templateUrl: 'todo_list.html', directives: const [TodoCard], pipes: const [StatusFilter])
class TodoList {
  TodoService _todoService;
  CheckboxFilterService filterService;

  Iterable<Todo> get todos => _todoService.todos.values;

  TodoList(this._todoService, this.filterService);
}

@Pipe(name: 'statusFilter')
class StatusFilter implements PipeTransform {
  Iterable<Todo> transform(Iterable<Todo> todos, [List<bool> args]) {
    bool done = args?.length >= 1 && args[0] == true;
    bool canceled = args?.length >= 2 && args[1] == true;

    return todos?.where((Todo todo) =>
    todo.status == Todo.statusPending || (done == true && todo.status == Todo.statusDone) ||
        (canceled == true && todo.status == Todo.statusCanceled));
  }
}