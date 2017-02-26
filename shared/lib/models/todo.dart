library shared.models.todo;

import 'package:jaguar_serializer/serializer.dart';
import 'package:bson/bson.dart';

part 'todo.g.dart';

@DefineFieldProcessor()
class MongoId implements FieldProcessor<String, ObjectId> {
  final Symbol field;

  const MongoId(this.field);

  @override
  ObjectId to(String value) => value == null ? null : ObjectId.parse(value);

  @override
  String from(ObjectId value) => value?.toHexString();
}

@GenSerializer()
@EnDecodeField(#id, asAndFrom: "_id")
class TodoSerializer extends Serializer<Todo> with _$TodoSerializer {
  @override
  Todo createModel() => new Todo();
}

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#id, asAndFrom: "_id")
class MongoTodoSerializer extends Serializer<Todo> with _$MongoTodoSerializer {
  @override
  Todo createModel() => new Todo();
}

class Todo {
  String id;
  String title;
  String content;
  String status = statusPending;

  static const String statusPending = "pending";
  static const String statusDone = "done";
  static const String statusCanceled = "canceled";
}
