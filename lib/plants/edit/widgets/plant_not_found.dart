import 'package:flutter/material.dart';

// Informa que a lista esta vazia
Widget plantNotFound() {
  return Padding(
    padding: const EdgeInsets.only(top: 250),
    child: Column(
      children: const [
        Center(
          child: Text(
            "Nenhuma planta encontrada.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          heightFactor: 4,
          child: Text("Tente adicionar uma planta.",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
        ),
      ],
    ),
  );
}
