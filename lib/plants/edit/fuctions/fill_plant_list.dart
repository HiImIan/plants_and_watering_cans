import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';
import 'package:josues_plants/plants/edit/widgets/search_bar.dart';

// Ao ser chamado recebe o item atualmente lido do banco de dados e o armazena em lista no aplicativo
Future<void> onAddPlant(event) async {
  var convertedEvent = GetPlant.forSnapshot(event.snapshot);
  listPlantsValues.add(convertedEvent);
  listPlantsKeys.add(event.snapshot.key);
  controllerLoadPlantList.negative();
  runPlantFilter("");
}

// determina um tempo limite que terá de espera até checar se a lista esta vazia
Future<void> limitedTime() async {
  await Future.delayed(const Duration(seconds: 4), () async {
    if (listPlantsValues.isEmpty) {
      controllerLoadPlantList.nullValue();
    }
  });
}
