// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenController on _HomeScreenControllerBase, Store {
  Computed<bool>? _$temNotasComputed;

  @override
  bool get temNotas => (_$temNotasComputed ??= Computed<bool>(
    () => super.temNotas,
    name: '_HomeScreenControllerBase.temNotas',
  )).value;
  Computed<bool>? _$estaEditandoComputed;

  @override
  bool get estaEditando => (_$estaEditandoComputed ??= Computed<bool>(
    () => super.estaEditando,
    name: '_HomeScreenControllerBase.estaEditando',
  )).value;

  late final _$notasAtom = Atom(
    name: '_HomeScreenControllerBase.notas',
    context: context,
  );

  @override
  ObservableList<ItemNota> get notas {
    _$notasAtom.reportRead();
    return super.notas;
  }

  @override
  set notas(ObservableList<ItemNota> value) {
    _$notasAtom.reportWrite(value, super.notas, () {
      super.notas = value;
    });
  }

  late final _$indiceEdicaoAtom = Atom(
    name: '_HomeScreenControllerBase.indiceEdicao',
    context: context,
  );

  @override
  int? get indiceEdicao {
    _$indiceEdicaoAtom.reportRead();
    return super.indiceEdicao;
  }

  @override
  set indiceEdicao(int? value) {
    _$indiceEdicaoAtom.reportWrite(value, super.indiceEdicao, () {
      super.indiceEdicao = value;
    });
  }

  late final _$tituloAtualAtom = Atom(
    name: '_HomeScreenControllerBase.tituloAtual',
    context: context,
  );

  @override
  String get tituloAtual {
    _$tituloAtualAtom.reportRead();
    return super.tituloAtual;
  }

  @override
  set tituloAtual(String value) {
    _$tituloAtualAtom.reportWrite(value, super.tituloAtual, () {
      super.tituloAtual = value;
    });
  }

  late final _$_HomeScreenControllerBaseActionController = ActionController(
    name: '_HomeScreenControllerBase',
    context: context,
  );

  @override
  void prepararNovaInformacao() {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.prepararNovaInformacao');
    try {
      return super.prepararNovaInformacao();
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void prepararEdicao(int indice) {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.prepararEdicao');
    try {
      return super.prepararEdicao(indice);
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool salvarInformacao() {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.salvarInformacao');
    try {
      return super.salvarInformacao();
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluirNota(int indice) {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.excluirNota');
    try {
      return super.excluirNota(indice);
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparCampos() {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizarTitulo(String novoTitulo) {
    final _$actionInfo = _$_HomeScreenControllerBaseActionController
        .startAction(name: '_HomeScreenControllerBase.atualizarTitulo');
    try {
      return super.atualizarTitulo(novoTitulo);
    } finally {
      _$_HomeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notas: ${notas},
indiceEdicao: ${indiceEdicao},
tituloAtual: ${tituloAtual},
temNotas: ${temNotas},
estaEditando: ${estaEditando}
    ''';
  }
}
