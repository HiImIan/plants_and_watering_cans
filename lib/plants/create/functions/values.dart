import 'package:flutter/material.dart';

// Esse meio atualiza um widget que esta sendo ouvido por um ValueListenableBuilder sem um setState
final ctrolLButtonRPlant = LoadButtonRegisterClb();

class LoadButtonRegisterClb extends ValueNotifier<bool> {
  LoadButtonRegisterClb() : super(false);
  positive() => value = true;
  negative() => value = false;
}
