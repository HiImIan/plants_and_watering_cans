import 'package:firebase_database/firebase_database.dart';

// Modo de mapeamento que ajuda a trazer de forma padronizada os dados do banco
class GetRoutine {
  String? routIndexs;
  String? routEnd;
  String? routInitial;
  String? routName;
  String? routWcan;
  int? routQty;

  GetRoutine(
      {this.routIndexs,
      this.routEnd,
      this.routInitial,
      this.routName,
      this.routQty});

// Transforma dados em JSON para algum tipo de dado maleável dentro do aplicativo
  GetRoutine.forSnapshot(DataSnapshot snapshot)
      : routIndexs = snapshot.child("routIndexs").value.toString(),
        routEnd = snapshot.child("routEnd").value.toString(),
        routInitial = snapshot.child("routInitial").value.toString(),
        routName = snapshot.child("routName").value.toString(),
        routWcan = snapshot.child("routWcan").value.toString(),
        routQty = snapshot.child("routQty").value as int;

  //transforma os dados em JSON
  toJson() {
    return {
      "routIndexs": routIndexs,
      "routEnd": routEnd,
      "routInitial": routInitial,
      "routName": routName,
      "routWcan": routWcan,
      "routQty": routQty,
    };
  }

// Gera uma versão em texto do resultado do banco de dados
  @override
  String toString() =>
      'routIndexs: $routIndexs, routEnd: $routEnd, routInitial: $routInitial, routName: $routName, routWcan: $routWcan, routQty: $routQty';
}
