import 'package:flutter/material.dart';
import 'package:fluxo_texto_app/core/theme_colors_app.dart';

class GraficoBarras extends StatefulWidget {
  final double porcentagemLetras;
  final double porcentagemNumeros;
  final double alturaTela;
  final double larguraTela;
  final Duration duracao;

  const GraficoBarras({
    super.key,
    required this.porcentagemLetras,
    required this.porcentagemNumeros,
    required this.alturaTela,
    required this.larguraTela,
    this.duracao = const Duration(milliseconds: 1500),
  });

  @override
  State<GraficoBarras> createState() => _GraficoBarrasState();
}

class _GraficoBarrasState extends State<GraficoBarras>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animacaoLetras;
  late Animation<double> _animacaoNumeros;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duracao, vsync: this);

    _animacaoLetras = Tween<double>(
      begin: 0.0,
      end: widget.porcentagemLetras,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _animacaoNumeros = Tween<double>(
      begin: 0.0,
      end: widget.porcentagemNumeros,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alturaMaximaGrafico = widget.alturaTela * 0.3;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _BarraGrafico(
              altura: (_animacaoLetras.value / 100) * alturaMaximaGrafico,
              largura: widget.larguraTela * 0.2,
              cor: ThemeColorsApp.vermelhoGrafico,
              porcentagem: '${_animacaoLetras.value.toStringAsFixed(0)}%',
              label: 'Letras',
              alturaTela: widget.alturaTela,
            ),

            SizedBox(width: widget.larguraTela * 0.05),

            _BarraGrafico(
              altura: (_animacaoNumeros.value / 100) * alturaMaximaGrafico,
              largura: widget.larguraTela * 0.2,
              cor: ThemeColorsApp.laranjaGrafico,
              porcentagem: '${_animacaoNumeros.value.toStringAsFixed(0)}%',
              label: 'Números',
              alturaTela: widget.alturaTela,
            ),
          ],
        );
      },
    );
  }
}

class _BarraGrafico extends StatelessWidget {
  final double altura;
  final double largura;
  final Color cor;
  final String porcentagem;
  final String label;
  final double alturaTela;

  const _BarraGrafico({
    required this.altura,
    required this.largura,
    required this.cor,
    required this.porcentagem,
    required this.label,
    required this.alturaTela,
  });

  @override
  Widget build(BuildContext context) {
    final alturaMinima = alturaTela * 0.05;
    final alturaFinal = altura < alturaMinima ? alturaMinima : altura;

    return Column(
      children: [
        AnimatedOpacity(
          opacity: altura > 0 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            porcentagem,
            style: TextStyle(
              fontSize: alturaTela * 0.018,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),

        SizedBox(height: alturaTela * 0.01),

        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: largura,
          height: alturaFinal,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black87, width: 2),
            boxShadow: [
              BoxShadow(
                color: cor.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),

        SizedBox(height: alturaTela * 0.01),

        Text(
          label,
          style: TextStyle(
            fontSize: alturaTela * 0.018,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
