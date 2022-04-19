import 'package:flutter/material.dart';
import 'package:josues_plants/routine/widgets/help_adm_routine.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/maps/get_routine.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/routine/functions/fill_lists.dart';
import 'package:josues_plants/routine/functions/values.dart';
import 'package:josues_plants/routine/widgets/create/modal_create.dart';
import 'package:josues_plants/routine/widgets/delete/modal_view.dart';
import 'package:josues_plants/routine/widgets/load_page.dart';
import 'package:josues_plants/routine/widgets/page_not_found.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

class RoutineCreateScreen extends StatefulWidget {
  const RoutineCreateScreen({Key? key}) : super(key: key);

  @override
  State<RoutineCreateScreen> createState() => _RoutineCreateScreenState();
}

final database = userneed.database;
late List<GetWcan> listWcansValues;
late List listWcansKeys;
late List<GetPlant> listPlantValues;
late List listPlantsKeys;
late List<GetRoutine> listRoutValues;
late List listRoutsKeys;
final TextEditingController searchWcan =
    TextEditingController(); // Variável que é alternada e afeta a barra de besquisa

final GlobalKey<FormState> routineFormKey = GlobalKey<
    FormState>(); // chave do Form() que valida se foi preenchido corretamente
// essas são as variáveis que irão conter o valor de cada campo preenchido no cadastro da wcana
final TextEditingController routineName = TextEditingController();
final TextEditingController routineInicialTime = TextEditingController();
final TextEditingController routineEndTime = TextEditingController();
final TextEditingController routineAmountIrrigation = TextEditingController();

//listas auxiliares que informam quais os checkbox marcados e quais itens esses checkbox pertencem
late List<bool> checksItens;
late List<int> checkIndex;

class _RoutineCreateScreenState extends State<RoutineCreateScreen> {
  @override
  initState() {
    super.initState();
    controllerLoadWcanList.positive();
    listWcansValues = [];
    listWcansKeys = [];
    listPlantValues = [];
    listPlantsKeys = [];
    listRoutValues = [];
    listRoutsKeys = [];
    checksItens = [];
    checkIndex = [];
    database.child("Wcans").onChildAdded.listen(onAddWcan);
    database.child("Plants").onChildAdded.listen(onAddPlant);
    database.child("Routine").onChildAdded.listen(onAddRoutine);
    limitedTime();
    ctrolLButtonRout.negative();
  }

  @override
  void dispose() {
    super.dispose();
    listWcansValues.clear();
    listWcansKeys.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Definir rotina"),
        actions: [
          IconButton(
              onPressed: () {
                helpAdmRoutine(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: controllerLoadWcanList,
          builder: (context, value, child) {
            return Column(
              children: [
                (controllerLoadWcanList.value == true)
                    ? awaitLoad()
                    : (controllerLoadWcanList.value == null &&
                            listWcansValues.isEmpty)
                        ? wcanNotFound()
                        : ValueListenableBuilder(
                            valueListenable: controllerSearchWcan,
                            builder: (context, value, child) {
                              return Expanded(
                                  child: ValueListenableBuilder(
                                      valueListenable:
                                          controllerRoutineListLength,
                                      builder: (context, value, child) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40),
                                          child: ListView.builder(
                                              itemCount: (controllerSearchWcan
                                                      .value.isEmpty)
                                                  ? listWcansValues.length
                                                  : controllerSearchWcan
                                                      .value.length,
                                              itemBuilder: (context, index) {
                                                var wCanItem =
                                                    (controllerSearchWcan
                                                            .value.isEmpty)
                                                        ? listWcansValues[index]
                                                        : controllerSearchWcan
                                                            .value[index];
                                                return Card(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: ListTile(
                                                    leading: Container(
                                                      color: Colors.blue,
                                                      width: 15,
                                                      height: double.maxFinite,
                                                    ),
                                                    title: Text(
                                                        wCanItem.wCanName
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "Máximo de vasos: " +
                                                                wCanItem
                                                                    .wCanCapacity
                                                                    .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    height:
                                                                        1.4)),
                                                        Text(
                                                            (wCanItem.wCanRain ==
                                                                    false)
                                                                ? "Irriga mesmo se chover"
                                                                : "Não irriga se chover",
                                                            style:
                                                                const TextStyle(
                                                                    height:
                                                                        1.4))
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
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              showBarModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  isDismissible:
                                                                      false,
                                                                  enableDrag:
                                                                      false,
                                                                  builder:
                                                                      (context) {
                                                                    return StatefulBuilder(builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            _update) {
                                                                      return modalRoutine(
                                                                          index,
                                                                          _update,
                                                                          context,
                                                                          wCanItem
                                                                              .wCanName);
                                                                    });
                                                                  }).whenComplete(() {
                                                                routineInicialTime
                                                                    .clear();
                                                                routineEndTime
                                                                    .clear();
                                                                routineName
                                                                    .clear();
                                                                routineAmountIrrigation
                                                                    .clear();
                                                                checkIndex
                                                                    .clear();
                                                                var index = 0;
                                                                for (var item
                                                                    in checksItens) {
                                                                  if (item) {
                                                                    checksItens.replaceRange(
                                                                        index,
                                                                        index +
                                                                            1,
                                                                        [
                                                                          false
                                                                        ]);
                                                                  }
                                                                  index++;
                                                                }
                                                                ctrolLButtonRout
                                                                    .negative();
                                                              });
                                                            },
                                                            child: const Text(
                                                                "Criar"))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }),
                                        );
                                      }));
                            },
                          ),
                Visibility(
                  visible: controllerLoadWcanList.value == false &&
                      listWcansValues.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan)),
                        onPressed: () {
                          showBarModalBottomSheet(
                              context: context,
                              isDismissible: false,
                              enableDrag: false,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter _update) {
                                  return routModalView(
                                    _update,
                                    context,
                                  );
                                });
                              });
                        },
                        child: const Text("Rotinas",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
