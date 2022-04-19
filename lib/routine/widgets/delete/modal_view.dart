import 'package:flutter/material.dart';
import 'package:josues_plants/routine/widgets/delete/rout_list_item.dart';

// Mostra uma lista para visualização e exclusão das rotinas criadas
routModalView(_update, context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.6,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue[300],
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              )),
          child: Column(
            children: const [
              Padding(
                padding:
                    EdgeInsets.only(top: 11, bottom: 15, left: 15, right: 15),
                child: Center(
                    child: Text(
                  "Rotinas criadas",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ],
          ),
        ),
        routListItem(context, _update),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 50), primary: Colors.blue),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
