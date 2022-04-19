import 'package:flutter/material.dart';

// Tela de carregamento enquanto espera a lista de plantas
Widget awaitLoad() {
  return Padding(
    padding: const EdgeInsets.only(top: 250),
    child: Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Center(
              child: Text("Por favor aguarde", style: TextStyle(fontSize: 18))),
        ),
        Center(child: CircularProgressIndicator()),
      ],
    ),
  );
}
