import 'package:flutter/material.dart';

// Demonstra uma tela quando não se tem uma lista
wcanNotFound() {
  return Padding(
    padding: const EdgeInsets.only(top: 250),
    child: Column(
      children: const [
        Center(
          child: Text(
            "Nenhuma regador encontrado",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          heightFactor: 4,
          child: Text("Tente criar um regador",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
        ),
      ],
    ),
  );
}
