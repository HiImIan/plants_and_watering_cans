import 'dart:core';

import 'package:firebase_database/firebase_database.dart';

// Modo de mapeamento que ajuda a trazer de forma padronizada os dados do banco
class GetWcan {
  int? wCanCapacity;
  String? wCanName;
  bool? wCanRain;

  GetWcan({
    this.wCanName,
    this.wCanCapacity,
    this.wCanRain,
  });
// Transforma dados em JSON para algum tipo de dado maleável dentro do aplicativo
  GetWcan.forSnapshot(DataSnapshot snapshot)
      : wCanName = snapshot.child("wCanName").value.toString(),
        wCanCapacity = snapshot.child("wCanCapacity").value as int,
        wCanRain = snapshot.child("wCanRain").value as bool;

//transforma os dados em JSON
  toJson() {
    return {
      "wCanCapacity": wCanCapacity,
      "wCanName": wCanName,
      "wCanRain": wCanRain,
    };
  }

// Gera uma versão em texto do resultado do banco de dados
  @override
  String toString() =>
      'wCanCapacity: $wCanCapacity, wCanName: $wCanName, wCanRain: $wCanRain';
}
