import 'package:flutter/material.dart';
import 'package:josues_plants/plants/edit/widgets/help_adm_plants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/plants/edit/widgets/plant_not_found.dart';
import 'package:josues_plants/plants/edit/fuctions/fill_plant_list.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';
import 'package:josues_plants/plants/edit/widgets/await_plants_load.dart';
import 'package:josues_plants/plants/edit/widgets/modal_edit_plant.dart';
import 'package:josues_plants/plants/edit/widgets/plant_delete_confirmation.dart';
import 'package:josues_plants/plants/edit/widgets/search_bar.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

class PlantsListAdm extends StatefulWidget {
  const PlantsListAdm({Key? key}) : super(key: key);

  @override
  State<PlantsListAdm> createState() => _PlantsListAdmState();
}

late GetPlant user;
final database = userneed.database;
late List<GetPlant> listPlantsValues;
late List listPlantsKeys;
final TextEditingController searchPlant =
    TextEditingController(); //chave do formulário que impede de prosseguir se os campos dentro dele não estiverem devidamente preenchidos

final GlobalKey<FormState> editPlantFormKey = GlobalKey<FormState>();

// essas são as variáveis que irão conter o valor de cada campo preenchido no cadastro da planta
final TextEditingController editPlantName = TextEditingController();
final TextEditingController editWaterNeed = TextEditingController();
final TextEditingController editWaterTimesADay = TextEditingController();

class _PlantsListAdmState extends State<PlantsListAdm> {
  @override
  initState() {
    super.initState();
    user = GetPlant();
    controllerLoadPlantList.positive();
    listPlantsValues = [];
    listPlantsKeys = [];
    database.child("Plants").onChildAdded.listen(onAddPlant);
    limitedTime();
  }

  @override
  void dispose() {
    super.dispose();
    listPlantsValues.clear();
    listPlantsKeys.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Widget principal que informa e recebe tudo sobre a lista das plantas
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plantas cadastradas"),
        actions: [
          IconButton(
              onPressed: () {
                helpAdmPlant(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: controllerLoadPlantList,
          builder: (context, value, child) {
            return Column(
              children: [
                plantSearchBar(context),
                (controllerLoadPlantList.value == true)
                    ? awaitLoad()
                    : (controllerLoadPlantList.value == null &&
                            listPlantsValues.isEmpty)
                        ? plantNotFound()
                        : ValueListenableBuilder(
                            valueListenable: controllerSearchPlant,
                            builder: (context, value, child) {
                              return Expanded(
                                  child: ValueListenableBuilder(
                                      valueListenable:
                                          controllerPlantListLength,
                                      builder: (context, value, child) {
                                        return ListView.builder(
                                            itemCount: (controllerSearchPlant
                                                    .value.isEmpty)
                                                ? listPlantsValues.length
                                                : controllerSearchPlant
                                                    .value.length,
                                            itemBuilder: (context, index) {
                                              var item = (controllerSearchPlant
                                                      .value.isEmpty)
                                                  ? listPlantsValues[index]
                                                  : controllerSearchPlant
                                                      .value[index];
                                              return Card(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: ListTile(
                                                  leading: Container(
                                                    color: Colors.blue,
                                                    width: 15,
                                                    height: double.maxFinite,
                                                  ),
                                                  title: Text(
                                                      item.plantName.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Quant. Água: " +
                                                              item.plantWater
                                                                  .toString() +
                                                              "L",
                                                          style:
                                                              const TextStyle(
                                                                  height: 1.4)),
                                                      Text(
                                                          "Quant. Irrigações: " +
                                                              item.plantTimes
                                                                  .toString() +
                                                              " p/ Dia",
                                                          style:
                                                              const TextStyle(
                                                                  height: 1.4))
                                                    ],
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 3,
                                                          horizontal: 12),
                                                  trailing: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                          color: Colors
                                                              .orange[200],
                                                          onPressed: () {
                                                            showBarModalBottomSheet(
                                                                context:
                                                                    context,
                                                                isDismissible:
                                                                    false,
                                                                builder:
                                                                    (context) {
                                                                  return StatefulBuilder(builder: (BuildContext
                                                                          context,
                                                                      StateSetter
                                                                          _update) {
                                                                    return editValues(
                                                                        index,
                                                                        _update,
                                                                        context,
                                                                        item);
                                                                  });
                                                                }).whenComplete(() {
                                                              editPlantName
                                                                  .clear();
                                                              editWaterNeed
                                                                  .clear();
                                                              editWaterTimesADay
                                                                  .clear();
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.edit_note)),
                                                      IconButton(
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          ctrolLButtonUPlant
                                                              .positive();
                                                          bool result = false;
                                                          confirmation(
                                                                  result,
                                                                  context,
                                                                  index)
                                                              .whenComplete(() {
                                                            setState(() {});
                                                            if (result ==
                                                                false) {
                                                              ctrolLButtonUPlant
                                                                  .negative();
                                                            }
                                                          });
                                                        },
                                                        icon: const Icon(Icons
                                                            .disabled_by_default),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      }));
                            },
                          )
              ],
            );
          }),
    );
  }
}
