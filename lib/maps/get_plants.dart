import 'package:firebase_database/firebase_database.dart';

// Modo de mapeamento que ajuda a trazer de forma padronizada os dados do banco
class GetPlant {
  String? plantName;
  String? plantTimes;
  String? plantWater;

  GetPlant({
    this.plantName,
    this.plantTimes,
    this.plantWater,
  });

// Transforma dados em JSON para algum tipo de dado maleável dentro do aplicativo
  GetPlant.forSnapshot(DataSnapshot snapshot)
      : plantName = snapshot.child("plantName").value.toString(),
        plantTimes = snapshot.child("plantTimes").value.toString(),
        plantWater = snapshot.child("plantWater").value.toString();

//transforma os dados em JSON
  toJson() {
    return {
      "plantName": plantName,
      "plantTimes": plantTimes,
      "plantWater": plantWater,
    };
  }

// Gera uma versão em texto do resultado do banco de dados
  @override
  String toString() =>
      'plantName: $plantName, plantTimes: $plantTimes, plantWater: $plantWater';
}
