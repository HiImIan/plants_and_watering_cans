import 'package:flutter/material.dart';
import 'package:josues_plants/watering_can/edit/widgets/help_adm_wcan.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/watering_can/edit/functions/fill_wcan_list.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/widgets/load_wcan_list.dart';
import 'package:josues_plants/watering_can/edit/widgets/modal_edit_wcan.dart';
import 'package:josues_plants/watering_can/edit/widgets/notifications.dart';
import 'package:josues_plants/watering_can/edit/widgets/wcan_not_found.dart';
import 'package:josues_plants/watering_can/edit/widgets/wcan_search_bar.dart';
import 'package:josues_plants/firebase/connect.dart' as userneed;

class WcanAdmList extends StatefulWidget {
  const WcanAdmList({Key? key}) : super(key: key);

  @override
  State<WcanAdmList> createState() => _WcanAdmListState();
}

late GetWcan user;
final database = userneed.database;

late List<GetWcan> listWcansValues;
late List listWcansKeys;
final TextEditingController searchWcan = TextEditingController();

final GlobalKey<FormState> editWcanFormKey = GlobalKey<
    FormState>(); // chave do Form() que valida se foi preenchido corretamente
// essas são as variáveis que irão conter o valor de cada campo preenchido no cadastro da wcana
final TextEditingController editWcanName = TextEditingController();
final TextEditingController editWcanCapacity = TextEditingController();

class _WcanAdmListState extends State<WcanAdmList> {
  @override
  initState() {
    super.initState();
    user = GetWcan();
    controllerLoadWcanList.positive();
    listWcansValues = [];
    listWcansKeys = [];
    database.child("Wcans").onChildAdded.listen(onAddWcan);
    limitedTime();
    checkEditRain.change(false);
  }

  @override
  void dispose() {
    super.dispose();
    listWcansValues.clear();
    listWcansKeys.clear();
  }

// classe principal responsável pela edição dos regadores que exige e fornece informações para todos os seus dependentes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de regadores"),
        actions: [
          IconButton(
              onPressed: () {
                helpAdmWcan(context);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: controllerLoadWcanList,
          builder: (context, value, child) {
            return Column(
              children: [
                wcanSearchBar(context),
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
                                      valueListenable: controllerWcanListLength,
                                      builder: (context, value, child) {
                                        return ListView.builder(
                                            itemCount: (controllerSearchWcan
                                                    .value.isEmpty)
                                                ? listWcansValues.length
                                                : controllerSearchWcan
                                                    .value.length,
                                            itemBuilder: (context, index) {
                                              var item = (controllerSearchWcan
                                                      .value.isEmpty)
                                                  ? listWcansValues[index]
                                                  : controllerSearchWcan
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
                                                      item.wCanName.toString(),
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
                                                          "Máximo de vasos: " +
                                                              item.wCanCapacity
                                                                  .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  height: 1.4)),
                                                      Text(
                                                          (item.wCanRain ==
                                                                  false)
                                                              ? "Irriga mesmo se chover"
                                                              : "Não irriga se chover",
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
                                                              if (editWcanName
                                                                  .text
                                                                  .isNotEmpty) {
                                                                editWcanName
                                                                    .clear();
                                                              }
                                                              if (editWcanCapacity
                                                                  .text
                                                                  .isNotEmpty) {
                                                                editWcanCapacity
                                                                    .clear();
                                                              }
                                                              if (checkEditRain
                                                                      .value !=
                                                                  false) {
                                                                checkEditRain
                                                                    .change(
                                                                        false);
                                                              }
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.edit_note)),
                                                      IconButton(
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          ctrolLButtonUWcan
                                                              .positive();
                                                          bool result = false;
                                                          deleteConfirmation(
                                                                  result,
                                                                  context,
                                                                  index)
                                                              .whenComplete(() {
                                                            setState(() {});
                                                            if (result ==
                                                                false) {
                                                              ctrolLButtonUWcan
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
