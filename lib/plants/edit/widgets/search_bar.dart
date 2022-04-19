import 'package:flutter/material.dart';
import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/plants/edit/fuctions/values.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';

// Filtra os caracteres escritos e retorna uma nova lista com todos os itens que contem tais caracteres na mesma ordem que foram escritos
void runPlantFilter(String enteredKeyword) {
  List<GetPlant> results = [];
  if (enteredKeyword.isEmpty) {
    results = listPlantsValues;
  } else {
    results = listPlantsValues
        .where((user) => user.plantName!.toLowerCase().contains(enteredKeyword))
        .toList();
  }

  controllerSearchPlant.change(results);
}

// Campo preenchivel que serve para auxiliar na busca por uma planta em especifico
Widget plantSearchBar(context) {
  return Visibility(
    visible: controllerLoadPlantList.value == false,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.145,
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              cursorColor: Colors.blue,
              onChanged: (value) => runPlantFilter(value.toLowerCase()),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: (controllerLoadPlantList.value == true ||
                        controllerLoadPlantList.value == null)
                    ? "Pesquisa indisponivel"
                    : "Pesquisar por:",
                hintText: "Nome da Planta",
                enabled: (controllerLoadPlantList.value == true ||
                        controllerLoadPlantList.value == null)
                    ? false
                    : true,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              controller: searchPlant,
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (!listPlantsValues
                      .toString()
                      .toLowerCase()
                      .contains(value.toString().toLowerCase())) {
                    return "Planta não encontrada";
                  }
                }
                return null;
              },
            ),
          ),
        ),
      ],
    ),
  );
}
