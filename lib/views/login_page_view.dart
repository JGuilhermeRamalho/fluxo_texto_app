import 'package:flutter/material.dart';
import 'package:fluxo_texto_app/core/theme_colors_app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controllers/login_controller/login_controller.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final LoginController _controller = LoginController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: estruturaTela(),
    );
  }

  Widget estruturaTela() {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: ThemeColorsApp.coresGradiente,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: larguraTela * 0.06),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: alturaTela * 0.12),
                        Column(
                          children: [
                            campoUsuario(),
                            SizedBox(height: alturaTela * 0.02),
                            campoSenha(),
                            SizedBox(height: alturaTela * 0.04),
                            botaoEntrar(),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () => _mostrarPoliticaPrivacidade(context),
                              child: Text(
                                'Política de Privacidade',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: larguraTela * 0.03,
                                ),
                              ),
                            ),
                            SizedBox(height: alturaTela * 0.025),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget campoUsuario() {
    final alturaTela = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Usuário',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: alturaTela * 0.01),
        Observer(
          builder: (_) => TextFormField(
            controller: _controller.usuarioController,
            onChanged: _controller.setUsuario,
            validator: _controller.validarUsuario,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: screenWidth * 0.06,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: screenWidth * 0.005,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: screenWidth * 0.0025,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: screenWidth * 0.005,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: alturaTela * 0.018,
              ),
            ),
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget campoSenha() {
    final alturaTela = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Senha',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: alturaTela * 0.01),
        Observer(
          builder: (_) => TextFormField(
            controller: _controller.senhaController,
            onChanged: _controller.setSenha,
            validator: _controller.validarSenha,
            obscureText: !_controller.senhaVisivel,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: screenWidth * 0.06,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _controller.senhaVisivel
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                  size: screenWidth * 0.06,
                ),
                onPressed: _controller.toggleSenhaVisivel,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: screenWidth * 0.005,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: screenWidth * 0.0025,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: screenWidth * 0.005,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: alturaTela * 0.018,
              ),
            ),
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget botaoEntrar() {
    final alturaTela = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Observer(
      builder: (_) => SizedBox(
        width: double.infinity,
        height: alturaTela * 0.065,
        child: ElevatedButton(
          onPressed: _controller.isLoading ? null : _controller.entrar,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.white.withOpacity(0.1),
            disabledForegroundColor: Colors.white54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            elevation: 0,
          ),
          child: _controller.isLoading
              ? SizedBox(
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
              : Text(
            'Entrar',
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarPoliticaPrivacidade(BuildContext context) {
    final alturaTelaDialog = MediaQuery.of(context).size.height;
    final larguraTelaDialog = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                Container(
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
                ),
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(larguraTelaDialog * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSecaoPolitica(
                          context,
                          'Última atualização',
                          'Janeiro de 2026',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.025),

                        _buildSecaoPolitica(
                          context,
                          '1. Coleta de Dados',
                          'Coletamos informações que você nos fornece diretamente, como nome, e-mail e outras informações de contato quando você cria uma conta ou usa nossos serviços.',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.02),

                        _buildSecaoPolitica(
                          context,
                          '2. Uso dos Dados',
                          'Utilizamos suas informações para fornecer, manter e melhorar nossos serviços, processar transações, enviar comunicações e personalizar sua experiência.',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.02),

                        _buildSecaoPolitica(
                          context,
                          '3. Compartilhamento de Dados',
                          'Não vendemos suas informações pessoais. Podemos compartilhar seus dados apenas com prestadores de serviços confiáveis que nos ajudam a operar nosso negócio.',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.02),

                        _buildSecaoPolitica(
                          context,
                          '4. Segurança',
                          'Implementamos medidas de segurança técnicas e organizacionais apropriadas para proteger suas informações pessoais contra acesso não autorizado, alteração, divulgação ou destruição.',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.02),

                        _buildSecaoPolitica(
                          context,
                          '5. Seus Direitos',
                          'Você tem o direito de acessar, corrigir, excluir ou exportar seus dados pessoais. Entre em contato conosco para exercer esses direitos.',
                        ),
                        SizedBox(height: alturaTelaDialog * 0.02),

                        _buildSecaoPolitica(
                          context,
                          '6. Contato',
                          'Se você tiver dúvidas sobre esta Política de Privacidade, entre em contato através do e-mail: privacidade@exemplo.com',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSecaoPolitica(BuildContext context, String titulo, String conteudo) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          conteudo,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}