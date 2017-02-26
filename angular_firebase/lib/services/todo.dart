import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'package:angular_firebase/firebase.dart';
import 'package:angular_firebase/model/todo.dart';

@Injectable()
class TodoService {
  static const String dbName = "todos";

  Firebase _firebase;

  DatabaseReference get _dbRef => _firebase.database?.ref(dbName);
  Map<String, Todo> _todos = {};

  Map<String, Todo> get todos => _todos;

  void _set(String key, Map data) {
    _todos[key] = new Todo.fromMap(data);
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

    _dbRef.onChildChanged.listen((QueryEvent event) {
      _set(event.snapshot.key, event.snapshot.val());
    });
  }

  void create(Todo todo) {
    _dbRef.push(todo.toMap());
  }

  void update(Todo todo) {
    DatabaseReference ref = _dbRef.child(todo.id);
    ref.update(todo.toMap());
  }
}
