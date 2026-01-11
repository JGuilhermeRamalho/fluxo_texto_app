class ItemNota {
  final String titulo;
  final String conteudo;
  final DateTime criadoEm;
  final DateTime? atualizadoEm;

  ItemNota({
    required this.titulo,
    required this.conteudo,
    required this.criadoEm,
    this.atualizadoEm,
  });

  ItemNota copiarCom({
    String? titulo,
    String? conteudo,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) {
    return ItemNota(
      titulo: titulo ?? this.titulo,
      conteudo: conteudo ?? this.conteudo,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    );
  }
}