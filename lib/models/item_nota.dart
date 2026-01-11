class ItemNota {
  final String titulo;
  final String conteudo;
  final DateTime criadoEm;
  final DateTime? atualizadoEm;
  final int quantidadeEdicoes;

  ItemNota({
    required this.titulo,
    required this.conteudo,
    required this.criadoEm,
    this.atualizadoEm,
    this.quantidadeEdicoes = 0,
  });

  int get quantidadeLinhas {
    if (conteudo.isEmpty) return 0;
    return conteudo.split('\n').length;
  }

  int get totalCaracteres {
    return conteudo.length;
  }

  int get quantidadeLetras {
    return conteudo.replaceAll(RegExp(r'[^a-zA-ZÀ-ÿ]'), '').length;
  }

  int get quantidadeNumeros {
    return conteudo.replaceAll(RegExp(r'[^0-9]'), '').length;
  }

  double get porcentagemLetras {
    final totalLetrasNumeros = quantidadeLetras + quantidadeNumeros;
    if (totalLetrasNumeros == 0) return 0;
    final resultado = (quantidadeLetras / totalLetrasNumeros) * 100;
    return resultado;
  }

  double get porcentagemNumeros {
    final totalLetrasNumeros = quantidadeLetras + quantidadeNumeros;
    if (totalLetrasNumeros == 0) return 0;
    final resultado = (quantidadeNumeros / totalLetrasNumeros) * 100;
    return resultado;
  }

  ItemNota copiarCom({
    String? titulo,
    String? conteudo,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    int? quantidadeEdicoes,
  }) {
    return ItemNota(
      titulo: titulo ?? this.titulo,
      conteudo: conteudo ?? this.conteudo,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      quantidadeEdicoes: quantidadeEdicoes ?? this.quantidadeEdicoes,
    );
  }
}