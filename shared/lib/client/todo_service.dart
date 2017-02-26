import 'dart:async';
import 'package:shared/models.dart';

abstract class TodoServiceInterface {
  Future create(Todo todo);
  Future read(dynamic id);
  Future update(Todo todo);
  Future delete(dynamic id);
}
