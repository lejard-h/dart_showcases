library shared.models;

import 'package:jaguar_serializer/serializer.dart'
    show JsonRepo, SerializerRepo;
import 'models/todo.dart' show TodoSerializer, MongoTodoSerializer;

export 'package:jaguar_serializer/serializer.dart';
export 'models/todo.dart';

SerializerRepo serializerRepository = new SerializerRepo()
  ..add(new TodoSerializer());

SerializerRepo jsonSerializer = new JsonRepo()..add(new TodoSerializer());

SerializerRepo mongoSerializer = new JsonRepo()..add(new MongoTodoSerializer());
