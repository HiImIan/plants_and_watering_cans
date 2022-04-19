import 'package:flutter/material.dart';
import 'package:josues_plants/maps/get_wcan.dart';
import 'package:josues_plants/watering_can/edit/main_screen.dart';

final controllerLoadWcanList = LoadList();

// Esse valor demonstra quando é necessário mostrar em tela um carregamento, a lista com os itens ou a informação de que não tem itens
class LoadList extends ValueNotifier<bool?> {
  LoadList() : super(false);

  positive() => value = true;
  negative() => value = false;
  nullValue() => value = null;
}

final ctrolLButtonUWcan = LoadButtonEditWcan();

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

final controllerWcanListLength = WcanListLength();

// Atualiza o tamanho da lista toda a vez que um item é excluido
class WcanListLength extends ValueNotifier<int> {
  WcanListLength() : super(listWcansValues.length);

  change() => value = listWcansValues.length;
  recall() {
    value = 0;
    value = listWcansValues.length;
  }
}

final checkEditRain = CheckRain();

// alterna o valor do checkbox e informa ao ValueListenableBuilder ouvinte
class CheckRain extends ValueNotifier<bool> {
  CheckRain() : super(false);
  change(newValue) => value = newValue;
}
