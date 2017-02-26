import 'dart:html';
import 'package:vanilla_dart/app.dart';
import 'package:vanilla_dart/dialog.dart';
import 'package:shared/models.dart';

void main() {
  App app = new App();
  Dialog dialog = new Dialog();

  querySelector(".mdl-button--fab").onClick.listen((_) async {
    var response = await dialog.show();
    if (response is Todo) {
      app.addTodo(response);
    }
  });
}
