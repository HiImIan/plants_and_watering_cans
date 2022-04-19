import 'package:flutter/material.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/routine/main_screen.dart';

// Classes que sendo ouvidas por diferentes ValueListenableBuilder atualizam somente aquilo que eles tem como child

final controllerLoadWcanList = LoadList();

// Esse valor demonstra quando é necessário mostrar em tela um carregamento, a lista com os itens ou a informação de que não tem itens
class LoadList extends ValueNotifier<bool?> {
  LoadList() : super(false);
  positive() => value = true;
  negative() => value = false;
  nullValue() => value = null;
}

final ctrolLButtonRout = LoadButtonEditWcan();

// Troca o estado do botão para um carregamento que dura até que os processos pendentes sejam encerrados
class LoadButtonEditWcan extends ValueNotifier<bool> {
  LoadButtonEditWcan() : super(false);
  positive() => value = true;
  negative() => value = false;
}

final controllerSearchWcan = SearchResult();

// Atualiza a lista dos regadores toda a vez que um novo valor é posto no campo da barra de pesquisa
class SearchResult extends ValueNotifier<List<GetWcan>> {
  SearchResult() : super([]);
  change(result) => value = result;
}

final controllerRoutineListLength = WcanListLength();

// Atualiza o tamanho da lista toda a vez que um item é excluido
class WcanListLength extends ValueNotifier<int> {
  WcanListLength() : super(listRoutValues.length);
  change() => value = listRoutValues.length;
  recall() {
    value = 0;
    value = listRoutValues.length;
  }
}
