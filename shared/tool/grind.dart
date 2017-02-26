import 'package:grinder/grinder.dart';
import 'package:jaguar_serializer/generator/generator/generator.dart';

@Task()
watch() {
  start(["watch"]);
}

@Task()
build() {
  start(["build"]);
}

main(List<String> args) => grind(args);
