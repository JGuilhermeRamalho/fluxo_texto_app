// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid => (_$isFormValidComputed ??= Computed<bool>(
    () => super.isFormValid,
    name: '_LoginControllerBase.isFormValid',
  )).value;

  late final _$usuarioAtom = Atom(
    name: '_LoginControllerBase.usuario',
    context: context,
  );

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(
    name: '_LoginControllerBase.senha',
    context: context,
  );

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_LoginControllerBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$senhaVisivelAtom = Atom(
    name: '_LoginControllerBase.senhaVisivel',
    context: context,
  );

  @override
  bool get senhaVisivel {
    _$senhaVisivelAtom.reportRead();
    return super.senhaVisivel;
  }

  @override
  set senhaVisivel(bool value) {
    _$senhaVisivelAtom.reportWrite(value, super.senhaVisivel, () {
      super.senhaVisivel = value;
    });
  }

  late final _$usuarioErroAtom = Atom(
    name: '_LoginControllerBase.usuarioErro',
    context: context,
  );

  @override
  String? get usuarioErro {
    _$usuarioErroAtom.reportRead();
    return super.usuarioErro;
  }

  @override
  set usuarioErro(String? value) {
    _$usuarioErroAtom.reportWrite(value, super.usuarioErro, () {
      super.usuarioErro = value;
    });
  }

  late final _$senhaErroAtom = Atom(
    name: '_LoginControllerBase.senhaErro',
    context: context,
  );

  @override
  String? get senhaErro {
    _$senhaErroAtom.reportRead();
    return super.senhaErro;
  }

  @override
  set senhaErro(String? value) {
    _$senhaErroAtom.reportWrite(value, super.senhaErro, () {
      super.senhaErro = value;
    });
  }

  late final _$entrarAsyncAction = AsyncAction(
    '_LoginControllerBase.entrar',
    context: context,
  );

  @override
  Future<void> entrar() {
    return _$entrarAsyncAction.run(() => super.entrar());
  }

  late final _$_LoginControllerBaseActionController = ActionController(
    name: '_LoginControllerBase',
    context: context,
  );

  @override
  void setUsuario(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.setUsuario',
    );
    try {
      return super.setUsuario(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.setSenha',
    );
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validarUsuario(String? value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.validarUsuario',
    );
    try {
      return super.validarUsuario(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validarSenha(String? value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.validarSenha',
    );
    try {
      return super.validarSenha(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validarFormulario() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.validarFormulario',
    );
    try {
      return super.validarFormulario();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSenhaVisivel() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
      name: '_LoginControllerBase.toggleSenhaVisivel',
    );
    try {
      return super.toggleSenhaVisivel();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
senha: ${senha},
isLoading: ${isLoading},
senhaVisivel: ${senhaVisivel},
usuarioErro: ${usuarioErro},
senhaErro: ${senhaErro},
isFormValid: ${isFormValid}
    ''';
  }
}
