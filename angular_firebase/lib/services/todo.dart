import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'package:angular_firebase/firebase.dart';
import 'package:shared/models.dart';
import 'package:shared/client.dart';

@Injectable()
class TodoService implements TodoServiceInterface {
  static const String dbName = "todos";

  Firebase _firebase;

  DatabaseReference get _dbRef => _firebase.database?.ref(dbName);
  Map<String, Todo> _todos = {};

  Map<String, Todo> get todos => _todos;

  void _set(String key, Map data) {
    _todos[key] = serializerRepository.from(data, type: Todo);
    _todos[key].id = key;
  }

  TodoService(this._firebase) {
    StreamSubscription init;
    init = _dbRef.onValue.listen((QueryEvent event) {
      Map<String, Map> values = event.snapshot.val();
      for (String key in values.keys) {
        _set(key, values[key]);
      }
      init.cancel();
    });

    _dbRef.onChildAdded.listen((QueryEvent event) {
      _set(event.snapshot.key, event.snapshot.val());
    });
  }

  Future create(Todo todo) async {
    return _dbRef.push(serializerRepository.to(todo));
  }

  @override
  Future read(dynamic id) async => _todos[id];

  Future update(Todo todo) {
    DatabaseReference ref = _dbRef.child(todo.id);
    return ref.update(serializerRepository.to(todo));
  }

  @override
  Future delete(dynamic id) {
    _todos.remove(id);
    return _dbRef.child(id).remove();
  }
}
