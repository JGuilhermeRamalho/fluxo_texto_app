import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../views/home_screen_view.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  String usuario = '';

  @observable
  String senha = '';

  @observable
  bool isLoading = false;

  @observable
  bool senhaVisivel = false;

  @observable
  String? usuarioErro;

  @observable
  String? senhaErro;

  @action
  void setUsuario(String value) {
    usuario = value;
    validarUsuario(value);
  }

  @action
  void setSenha(String value) {
    senha = value;
    validarSenha(value);
  }

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  String? validarUsuario(String? value) {
    if (value == null || value.isEmpty) {
      usuarioErro = 'Por favor, insira o usuário';
      return usuarioErro;
    }
    if (value.length < 3) {
      usuarioErro = 'Usuário deve ter no mínimo 3 caracteres';
      return usuarioErro;
    }
    usuarioErro = null;
    return null;
  }

  @action
  String? validarSenha(String? value) {
    if (value == null || value.isEmpty) {
      senhaErro = 'Por favor, insira a senha';
      return senhaErro;
    }
    if (value.length < 6) {
      senhaErro = 'Senha deve ter no mínimo 6 caracteres';
      return senhaErro;
    }
    senhaErro = null;
    return null;
  }

  @action
  bool validarFormulario() {
    return formKey.currentState?.validate() ?? false;
  }


  Future<void> entrar(BuildContext context) async {
    if (validarFormulario()) {
      setLoading(true);

      await Future.delayed(const Duration(seconds: 2));

      print('Usuário: ${usuarioController.text}');
      print('Senha: ${senhaController.text}');

      setLoading(false);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreenView(),
        ),
      );
    }
  }

  @action
  void toggleSenhaVisivel() {
    senhaVisivel = !senhaVisivel;
  }

  @computed
  bool get isFormValid => usuarioErro == null && senhaErro == null && usuario.isNotEmpty && senha.isNotEmpty;

  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
  }
}