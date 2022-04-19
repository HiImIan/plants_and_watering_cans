import 'package:flutter/material.dart';
import 'package:josues_plants/maps/get_plants.dart';
import 'package:josues_plants/plants/edit/main_screen.dart';

// Valores que são ouvidos separadamente por um ValueListenableBuilder que os atualiza conforme mudam seus valores

final controllerLoadPlantList = LoadList();

// alterna a visão entre um icone de carregamento, a lista de plantas ou uma mensagem para informar a falta da lista
class LoadList extends ValueNotifier<bool?> {
  LoadList() : super(false);
  positive() => value = true;
  negative() => value = false;
  nullValue() => value = null;
}

final ctrolLButtonUPlant = LoadButtonEditPlant();

// Alterna o valor do botão para que uma vez precionado, não responda novamente até que as confirmações sejam feitas
class LoadButtonEditPlant extends ValueNotifier<bool> {
  LoadButtonEditPlant() : super(false);
  positive() => value = true;
  negative() => value = false;
}

final controllerSearchPlant = SearchResult();

// alterna o valor da lista conforme a barra de pesquisa tem um novo valor
class SearchResult extends ValueNotifier<List<GetPlant>> {
  SearchResult() : super([]);
  change(result) => value = result;
}

final controllerPlantListLength = PlantListLength();

// atualiza a lista quando uma planta é excluida da lista
class PlantListLength extends ValueNotifier<int> {
  PlantListLength() : super(listPlantsValues.length);
  change() => value = listPlantsValues.length;
  recall() {
    value = 0;
    value = listPlantsValues.length;
  }
}
