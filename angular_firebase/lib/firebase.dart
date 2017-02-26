import 'dart:async';
import 'package:resource/resource.dart' show Resource;
import 'package:firebase/firebase.dart' show initializeApp, database, Database;
import 'package:yaml/yaml.dart' show loadYaml;

const String _firebaseConfigFile = "firebase.yaml";
const String _apiKey = "api_key";
const String _authDomain = "auth_domain";
const String _databaseUrl = "database_url";
const String _storageBucket = "storage_bucket";
const String _messagingSenderId = "messaging_sender_id";

Future<Firebase> initFirebase() async {
  Resource resource =
      new Resource('$_firebaseConfigFile');
  String content = await resource.readAsString();
  Map<String, String> config = loadYaml(content);

  initializeApp(
      apiKey: config[_apiKey],
      authDomain: config[_authDomain],
      databaseURL: config[_databaseUrl],
      storageBucket: config[_storageBucket]);

  return new Firebase(database());
}

class Firebase {
  Database database;
  Firebase(this.database);
}