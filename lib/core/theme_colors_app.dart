import 'package:flutter/material.dart';

class ThemeColorsApp {

  ThemeColorsApp._();

  // CORES DOS GRÁFICOS

  static const Color vermelhoGrafico = Color(0xFF8B1A1A);

  static const Color laranjaGrafico = Colors.orange;

  // GRADIENTE PARA AS TELAS DO APP

  static const LinearGradient coresGradiente = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A3D47),
      Color(0xFF2C5F6F),
    ],
  );

}