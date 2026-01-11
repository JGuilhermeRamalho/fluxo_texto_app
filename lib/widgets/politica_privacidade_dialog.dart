import 'package:flutter/material.dart';

class PoliticaPrivacidadeDialog extends StatelessWidget {
  const PoliticaPrivacidadeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alturaTelaDialog = MediaQuery.of(context).size.height;
    final larguraTelaDialog = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(larguraTelaDialog * 0.04),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: larguraTelaDialog * 0.9,
          maxHeight: alturaTelaDialog * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topoDialog(context, larguraTelaDialog),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(larguraTelaDialog * 0.06),
                child: conteudoDialog(context, alturaTelaDialog, larguraTelaDialog),
              ),
            ),
            rodapeDialog(context, alturaTelaDialog, larguraTelaDialog),
          ],
        ),
      ),
    );
  }

  Widget topoDialog(BuildContext context, double larguraTelaDialog) {
    return Container(
      padding: EdgeInsets.all(larguraTelaDialog * 0.06),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(larguraTelaDialog * 0.04),
          topRight: Radius.circular(larguraTelaDialog * 0.04),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.privacy_tip_outlined,
            color: Colors.grey[700],
            size: larguraTelaDialog * 0.07,
          ),
          SizedBox(width: larguraTelaDialog * 0.03),
          Expanded(
            child: Text(
              'Política de Privacidade',
              style: TextStyle(
                fontSize: larguraTelaDialog * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.grey[600],
            iconSize: larguraTelaDialog * 0.06,
          ),
        ],
      ),
    );
  }

  Widget conteudoDialog(BuildContext context, double alturaTelaDialog, double larguraTelaDialog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        secaoPolitica(
          context,
          'Última atualização',
          'Janeiro de 2026',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.025),
        secaoPolitica(
          context,
          '1. Coleta de Dados',
          'Coletamos informações que você nos fornece diretamente, como nome, e-mail e outras informações de contato quando você cria uma conta ou usa nossos serviços.',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.02),
        secaoPolitica(
          context,
          '2. Uso dos Dados',
          'Utilizamos suas informações para fornecer, manter e melhorar nossos serviços, processar transações, enviar comunicações e personalizar sua experiência.',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.02),
        secaoPolitica(
          context,
          '3. Compartilhamento de Dados',
          'Não vendemos suas informações pessoais. Podemos compartilhar seus dados apenas com prestadores de serviços confiáveis que nos ajudam a operar nosso negócio.',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.02),
        secaoPolitica(
          context,
          '4. Segurança',
          'Implementamos medidas de segurança técnicas e organizacionais apropriadas para proteger suas informações pessoais contra acesso não autorizado, alteração, divulgação ou destruição.',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.02),
        secaoPolitica(
          context,
          '5. Seus Direitos',
          'Você tem o direito de acessar, corrigir, excluir ou exportar seus dados pessoais. Entre em contato conosco para exercer esses direitos.',
          larguraTelaDialog,
        ),
        SizedBox(height: alturaTelaDialog * 0.02),
        secaoPolitica(
          context,
          '6. Contato',
          'Se você tiver dúvidas sobre esta Política de Privacidade, entre em contato através do e-mail: privacidade@exemplo.com',
          larguraTelaDialog,
        ),
      ],
    );
  }

  Widget rodapeDialog(BuildContext context, double alturaTelaDialog, double larguraTelaDialog) {
    return Container(
      padding: EdgeInsets.all(larguraTelaDialog * 0.06),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(larguraTelaDialog * 0.04),
          bottomRight: Radius.circular(larguraTelaDialog * 0.04),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: alturaTelaDialog * 0.018),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(larguraTelaDialog * 0.02),
            ),
            elevation: 0,
          ),
          child: Text(
            'Entendi',
            style: TextStyle(
              fontSize: larguraTelaDialog * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget secaoPolitica(
      BuildContext context,
      String titulo,
      String conteudo,
      double larguraTelaDialog,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: larguraTelaDialog * 0.045,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.008),
        Text(
          conteudo,
          style: TextStyle(
            fontSize: larguraTelaDialog * 0.038,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }

}