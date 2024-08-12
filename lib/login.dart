import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prosper/account_registration.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/app_images.dart';
import 'package:prosper/utils/common.dart';
import 'package:prosper/welcome.dart';
import 'package:prosper/widgets/default_button.dart';
import 'package:prosper/widgets/google_button.dart';

class LoginPage extends StatefulWidget {
  static const String screenName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(35),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.asset(
                    AppImages.logoProsper,
                    width: 100,
                    height: 154,
                  ),
                ),
              ),
              const SizedBox(height: 55),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              _buildForgotPasswordText(),
              const SizedBox(height: 20),
              DefaultButton(
                text: 'Entrar',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Realiza a ação de login aqui
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando login...')),
                    );
                  }
                },
              ),
              const SizedBox(height: 30,),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Ainda não tem uma conta?",
                    style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                    children: [
                      TextSpan(
                        text: " Cadastre-se",
                        style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigatorKey.currentState!.pushNamed(AccountRegistration.screenName);
                        }
                      )
                    ]
                  )
                ),
              ),
              const SizedBox(height: 15),
              Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'ou',
                    style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Center(
              child: GoogleButton(
                //adicionar validação e coleta de dados para cadastro com o Google aqui
                onPressed: () {}
              )
            )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'E-mail',
        hintText: 'Digite seu e-mail',
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite seu e-mail';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Por favor, digite um e-mail válido';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Senha',
        hintText: 'Digite sua senha',
        hintStyle: const TextStyle(color: Colors.white54),
        labelStyle: const TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          color: Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite sua senha';
        }
        if (value.length < 6) {
          return 'A senha deve ter pelo menos 6 caracteres';
        }
        return null;
      },
    );
  }

  Widget _buildForgotPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            // Ação quando o texto "Esqueceu sua senha?" for clicado
          },
          child: Text(
            'Esqueceu sua senha?',
            style: TextStyle(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
  
}
