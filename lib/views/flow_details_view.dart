import 'package:flutter/material.dart';
import 'package:fluxo_texto_app/core/theme_colors_app.dart';
import 'package:fluxo_texto_app/widgets/politica_privacidade_dialog.dart';
import '../models/item_nota.dart';
import '../widgets/barra_grafico.dart';

class FlowDetailsView extends StatelessWidget {
  final ItemNota nota;

  const FlowDetailsView({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    final larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: estruturaTela(context, alturaTela, larguraTela),
    );
  }

  Widget estruturaTela(
    BuildContext context,
    double alturaTela,
    double larguraTela,
  ) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: ThemeColorsApp.coresGradiente,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(larguraTela * 0.04),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: alturaTela * 0.035,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    padding: EdgeInsets.all(larguraTela * 0.02),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: larguraTela * 0.04),
                child: Column(
                  children: [cardDetalhes(alturaTela, larguraTela)],
                ),
              ),
            ),
            rodape(context, alturaTela, larguraTela),
          ],
        ),
      ),
    );
  }

  Widget cardDetalhes(double alturaTela, double larguraTela) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(larguraTela * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Detalhes',
            style: TextStyle(
              fontSize: alturaTela * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: alturaTela * 0.03),
          informacaoTexto(
            'Quantidade de linhas:',
            nota.quantidadeLinhas.toString(),
            alturaTela,
          ),

          SizedBox(height: alturaTela * 0.015),

          informacaoTexto(
            'Quantidade de edições:',
            nota.quantidadeEdicoes.toString(),
            alturaTela,
          ),

          SizedBox(height: alturaTela * 0.015),

          informacaoTexto(
            'Caracteres:',
            nota.totalCaracteres.toString(),
            alturaTela,
          ),

          SizedBox(height: alturaTela * 0.04),

          GraficoBarras(
            porcentagemLetras: nota.porcentagemLetras,
            porcentagemNumeros: nota.porcentagemNumeros,
            alturaTela: alturaTela,
            larguraTela: larguraTela,
          ),
        ],
      ),
    );
  }

  Widget informacaoTexto(String label, String valor, double alturaTela) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: alturaTela * 0.02, color: Colors.black87),
        ),
        Text(
          valor,
          style: TextStyle(
            fontSize: alturaTela * 0.02,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget rodape(BuildContext context, double alturaTela, double larguraTela) {
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
          style: TextStyle(color: Colors.white, fontSize: alturaTela * 0.017),
        ),
      ),
    );
  }
}
