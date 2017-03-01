import 'dart:async';
import 'package:firebase/firebase.dart' show initializeApp, database, Database;
import 'package:fnx_config/fnx_config_read.dart';

const String _firebaseConfigKey = "firebase";
const String _apiKey = "api_key";
const String _authDomain = "auth_domain";
const String _databaseUrl = "database_url";
const String _storageBucket = "storage_bucket";
const String _messagingSenderId = "messaging_sender_id";

Future<Firebase> initFirebase() async {
  Map<String, String> config = fnxConfig()[_firebaseConfigKey];

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