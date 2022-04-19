import 'package:flutter/material.dart';

// Informa que a lista não pode ser exibida
wcanNotFound() {
  return Padding(
    padding: const EdgeInsets.only(top: 250),
    child: Column(
      children: const [
        Center(
          child: Text(
            "Nenhum recador encontrado.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          heightFactor: 4,
          child: Text("Tente adicionar um regador.",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
        ),
      ],
    ),
  );
}
