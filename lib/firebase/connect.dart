import 'package:firebase_database/firebase_database.dart';

// São funções que são chamadas no inicio do aplicativo para se conectar e desconectar do banco de dados

late DatabaseReference database;

dbconnect() async {
  database = FirebaseDatabase.instance.ref();
}

dbDisconnect() async {
  database.onDisconnect();
}
