import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../models/item_nota.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenControllerBase with _$HomeScreenController;

abstract class _HomeScreenControllerBase with Store {
  final TextEditingController controladorTexto = TextEditingController();

  @observable
  ObservableList<ItemNota> notas = ObservableList<ItemNota>();

  @observable
  int? indiceEdicao;

  @observable
  String tituloAtual = 'informação 1';

  @computed
  bool get temNotas => notas.isNotEmpty;

  @computed
  bool get estaEditando => indiceEdicao != null;

  @action
  void prepararNovaInformacao() {
    indiceEdicao = null;
    tituloAtual = 'informação ${notas.length + 1}';
    controladorTexto.clear();
  }

  @action
  void prepararEdicao(int indice) {
    indiceEdicao = indice;
    tituloAtual = notas[indice].titulo;
    controladorTexto.text = notas[indice].conteudo;
  }

  @action
  bool salvarInformacao() {
    if (controladorTexto.text.trim().isEmpty) return false;

    if (estaEditando) {
      notas[indiceEdicao!] = notas[indiceEdicao!].copiarCom(
        conteudo: controladorTexto.text.trim(),
        atualizadoEm: DateTime.now(),
      );
    } else {
      final novaNota = ItemNota(
        titulo: tituloAtual,
        conteudo: controladorTexto.text.trim(),
        criadoEm: DateTime.now(),
      );
      notas.add(novaNota);
    }

    limparCampos();
    return true;
  }

  @action
  void excluirNota(int indice) {
    notas.removeAt(indice);

    for (int i = 0; i < notas.length; i++) {
      notas[i] = notas[i].copiarCom(titulo: 'informação ${i + 1}');
    }
  }

  @action
  void limparCampos() {
    indiceEdicao = null;
    tituloAtual = 'informação ${notas.length + 1}';
    controladorTexto.clear();
  }

  @action
  void atualizarTitulo(String novoTitulo) {
    tituloAtual = novoTitulo;
  }

  void dispose() {
    controladorTexto.dispose();
  }
}