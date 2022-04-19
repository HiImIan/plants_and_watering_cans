import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';
import 'package:josues_plants/watering_can/edit/widgets/wcan_search_bar.dart';

// Acionado quando se tem ao menos um item no banco de dados
Future<void> onAddWcan(event) async {
  try {
    var convertedEvent = GetWcan.forSnapshot(event.snapshot);
    listWcansValues.add(convertedEvent);
    listWcansKeys.add(event.snapshot.key);
    controllerLoadWcanList.negative();
    runWcanFilter("");
  } catch (e) {
    print(e);
  }
}

// Determina um tempo limite de espera para definir que a lista será vazia
Future<void> limitedTime() async {
  await Future.delayed(const Duration(seconds: 4), () async {
    if (listWcansValues.isEmpty) {
      controllerLoadWcanList.nullValue();
    }
  });
}
