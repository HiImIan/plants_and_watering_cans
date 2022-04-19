import 'package:flutter/material.dart';

//classes que atualizam widgets de forma separada quando ouvidas por um ValueListenableBuilder

final checkRain = CheckRain();

// atualiza um checkbox que é marcado ou não pelo usuário
class CheckRain extends ValueNotifier<bool> {
  CheckRain() : super(false);

  change(newValue) => value = newValue;
}

final ctrolLButtonRWcan = LoadButtonRegisterQcan();

// Determina se o botão responde ou não aos processos requisitados
class LoadButtonRegisterQcan extends ValueNotifier<bool> {
  LoadButtonRegisterQcan() : super(false);

  positive() => value = true;
  negative() => value = false;
}
