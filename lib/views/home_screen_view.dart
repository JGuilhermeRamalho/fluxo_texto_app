import 'package:flutter/material.dart';
import 'package:fluxo_texto_app/core/theme_colors_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluxo_texto_app/views/flow_details_view.dart';
import 'package:fluxo_texto_app/widgets/politica_privacidade_dialog.dart';

import '../controllers/home_controller/home_screen_controller.dart';
import '../models/item_nota.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final HomeScreenController _controlador = HomeScreenController();

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: estruturaTela(),
    );
  }

  Widget estruturaTela() {
    final alturaTela = MediaQuery.of(context).size.height;
    final larguraTela = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: ThemeColorsApp.coresGradiente,
        ),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => _controlador.temNotas
                    ? listaInformacoes(alturaTela, larguraTela)
                    : telaVazia(alturaTela, larguraTela),
              ),
            ),
            rodape(alturaTela, larguraTela),
          ],
        ),
      ),
    );
  }

  Widget telaVazia(double alturaTela, double larguraTela) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nenhuma informação salva',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: alturaTela * 0.022,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: alturaTela * 0.03),
          ElevatedButton(
            onPressed: abrirDialogTeclado,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              padding: EdgeInsets.symmetric(
                horizontal: larguraTela * 0.08,
                vertical: alturaTela * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Digite seu texto',
              style: TextStyle(
                fontSize: alturaTela * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listaInformacoes(double alturaTela, double larguraTela) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(larguraTela * 0.04),
          child: ElevatedButton(
            onPressed: abrirDialogTeclado,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              minimumSize: Size(double.infinity, alturaTela * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Digite seu texto',
              style: TextStyle(
                fontSize: alturaTela * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: larguraTela * 0.04),
            itemCount: _controlador.notas.length,
            itemBuilder: (context, indice) {
              return construirCardInformacao(indice, alturaTela, larguraTela);
            },
          ),
        ),
      ],
    );
  }

  Widget construirCardInformacao(int indice, double alturaTela, double larguraTela) {
    final nota = _controlador.notas[indice];

    return Container(
      margin: EdgeInsets.only(bottom: alturaTela * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(larguraTela * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    nota.titulo,
                    style: TextStyle(
                      fontSize: alturaTela * 0.02,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: alturaTela * 0.025),
                      onPressed: () => editarInformacao(indice),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    SizedBox(width: larguraTela * 0.02),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                        size: alturaTela * 0.025,
                      ),
                      onPressed: () => mostrarDialogoExcluir(indice),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: alturaTela * 0.015),
            Center(
              child: TextButton(
                onPressed: () => verDetalhes(nota),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Ver detalhes',
                  style: TextStyle(
                    fontSize: alturaTela * 0.02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rodape(double alturaTela, double larguraTela) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: alturaTela * 0.02),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const PoliticaPrivacidadeDialog(),
          );
        },
        child: Text(
          'Política de Privacidade',
          style: TextStyle(
            color: Colors.white,
            fontSize: alturaTela * 0.017,
          ),
        ),
      ),
    );
  }

  void abrirDialogTeclado() {
    _controlador.prepararNovaInformacao();

    showDialog(
      context: context,
      builder: (context) => construirDialogDigitacao(),
    );
  }

  void editarInformacao(int indice) {
    _controlador.prepararEdicao(indice);

    showDialog(
      context: context,
      builder: (context) => construirDialogDigitacao(),
    );
  }

  Widget construirDialogDigitacao() {
    final alturaTela = MediaQuery.of(context).size.height;
    final larguraTela = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: alturaTela * 0.5,
        width: larguraTela * 0.9,
        padding: EdgeInsets.all(larguraTela * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) => Text(
                      _controlador.tituloAtual,
                      style: TextStyle(
                        fontSize: alturaTela * 0.022,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: alturaTela * 0.025),
                  onPressed: () => Navigator.pop(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: alturaTela * 0.02),
            Expanded(
              child: TextField(
                controller: _controlador.controladorTexto,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontSize: alturaTela * 0.02),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu texto aqui...',
                ),
              ),
            ),
            SizedBox(height: alturaTela * 0.02),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: () {
                  if (_controlador.salvarInformacao()) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Por favor, digite algo antes de salvar',
                          style: TextStyle(fontSize: alturaTela * 0.018),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, alturaTela * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _controlador.estaEditando ? 'Atualizar' : 'Salvar',
                  style: TextStyle(
                    fontSize: alturaTela * 0.02,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verDetalhes(ItemNota nota) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlowDetailsView(nota: nota),
      ),
    );
  }

  void mostrarDialogoExcluir(int indice) {
    final alturaTela = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Excluir informação',
          style: TextStyle(fontSize: alturaTela * 0.022),
        ),
        content: Text(
          'Deseja realmente excluir esta informação?',
          style: TextStyle(fontSize: alturaTela * 0.02),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: alturaTela * 0.018),
            ),
          ),
          TextButton(
            onPressed: () {
              _controlador.excluirNota(indice);
              Navigator.pop(context);
            },
            child: Text(
              'Excluir',
              style: TextStyle(
                color: Colors.red,
                fontSize: alturaTela * 0.018,
              ),
            ),
          ),
        ],
      ),
    );
  }
}