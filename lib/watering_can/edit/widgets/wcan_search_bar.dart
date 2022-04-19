import 'package:flutter/material.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/watering_can/edit/functions/values.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';

// Filtra a lista de regadores conforme o valor atribuido ao campo
void runWcanFilter(String enteredKeyword) {
  List<GetWcan> results = [];
  if (enteredKeyword.isEmpty) {
    // if the search field is empty or only contains white-space, we'll display all users
    results = listWcansValues;
  } else {
    results = listWcansValues
        .where((user) => user.wCanName!.toLowerCase().contains(enteredKeyword))
        .toList();
  }

  controllerSearchWcan.change(results);
}

// Campo preenchivel pelo usuário que atualiza a lista conforme um novo resultado é atribuido
Widget wcanSearchBar(context) {
  return Visibility(
    visible: controllerLoadWcanList.value == false,
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
              onChanged: (value) => runWcanFilter(value.toLowerCase()),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: (controllerLoadWcanList.value == true ||
                        controllerLoadWcanList.value == null)
                    ? "Pesquisa indisponivel"
                    : "Pesquisar por:",
                hintText: "Nome do Regador",
                enabled: (controllerLoadWcanList.value == true ||
                        controllerLoadWcanList.value == null)
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
              controller: searchWcan,
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (!listWcansValues
                      .toString()
                      .toLowerCase()
                      .contains(value.toString().toLowerCase())) {
                    return "Regador não encontrado";
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
