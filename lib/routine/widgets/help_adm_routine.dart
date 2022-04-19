import 'package:flutter/material.dart';

// Widget que auxilia a entender como funciona a organização das rotinas
helpAdmRoutine(context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Funções disponiveis')),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Toda a etapa de criação, visualização e exclusão das rotinas é feito aqui, os botões responsáveis por essas interações são:\n\nCriar: Essa aba serve para criar uma nova rotina, tenha em mente que rotinas criadas não podem ser alteradas posteriormente.\n\nRotinas: Quando desejar visualizar ou excluir as rotinas criadas pressione o botão "Rotinas" e posteriormente caso tenha a necessidade, clique ícone de lata de lixo vermelha para excluir.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Certo'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
