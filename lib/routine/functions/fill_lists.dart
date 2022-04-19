import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/maps/get_routine.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/main_screen.dart';

// Após obter algum resultado do banco de dados essas funçõe são chamadas para preencher listas especificas com informações

// Preenche a lista com informações dos regadores cadastrados
Future<void> onAddWcan(event) async {
  try {
    var convertedEvent = GetWcan.forSnapshot(event.snapshot);
    listWcansValues.add(convertedEvent);
    listWcansKeys.add(event.snapshot.key);
    controllerLoadWcanList.negative();
  } catch (e) {
    print(e);
  }
}

// Preenche a lista com informações sobre as plantas registradas
Future<void> onAddPlant(event) async {
  try {
    var convertedEvent = GetPlant.forSnapshot(event.snapshot);
    listPlantValues.add(convertedEvent);
    listPlantsKeys.add(event.snapshot.key);
    checksItens.add(false);
    controllerLoadWcanList.negative();
  } catch (e) {
    print(e);
  }
}

// Preenche a lista com os valores das rotinas criadas
Future<void> onAddRoutine(event) async {
  try {
    var convertedEvent = GetRoutine.forSnapshot(event.snapshot);
    if (!listRoutValues.toString().contains(convertedEvent.toString())) {
      listRoutValues.add(convertedEvent);
      listRoutsKeys.add(event.snapshot.key);
      controllerLoadWcanList.negative();
    }
  } catch (e) {
    print(e);
  }
}

Future<void> limitedTime() async {
  await Future.delayed(const Duration(seconds: 4), () async {
    if (listWcansValues.isEmpty) {
      controllerLoadWcanList.nullValue();

      print("load é null");
    }
  });
}
