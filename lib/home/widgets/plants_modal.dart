import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:josues_plants/plants/create/main_screen.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future plantsModal(context) {
  return showBarModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 60),
                  child: Text(
                    "Opções disponíveis",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(double.maxFinite, 60))),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const PlantsCreateScreen()));
                            },
                            child: const Text("Adicionar plantas",
                                style: TextStyle(fontSize: 18))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(double.maxFinite, 60))),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const PlantsListAdm()));
                            },
                            child: const Text("Gerenciar plantas",
                                style: TextStyle(fontSize: 18))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 40),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(double.maxFinite, 60))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Voltar",
                                style: TextStyle(fontSize: 18))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
