import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:loader_overlay/loader_overlay.dart";
import "package:prosper/login.dart";
import "package:prosper/utils/app_images.dart";
import "package:prosper/widgets/default_button.dart";
import "package:prosper/widgets/google_button.dart";

class AccountRegistration extends StatefulWidget {
  static const String screenName = '/account_registration';
  const AccountRegistration({super.key});

  @override
  State<AccountRegistration> createState() => _AccountRegistrationState();
}

class _AccountRegistrationState extends State<AccountRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _senha;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    context.loaderOverlay.show(); 

    await Future.delayed(const Duration(seconds: 3));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso!')),
    );

    context.loaderOverlay.hide(); 
    Navigator.of(context).pushNamed(LoginPage.screenName);
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    AppImages.logoProsper,
                    width: 100,
                    height: 154,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildNameField(),
                    const SizedBox(height: 10),
                    _buildEmailField(),
                    const SizedBox(height: 10),
                    _buildPasswordField(),
                    const SizedBox(height: 10),
                    _buildPasswordConfirmationField(),
                    const SizedBox(height: 50),
                    DefaultButton(
                      text: "Cadastrar",
                      onPressed: _submit,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'ou',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            endIndent: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    Center(
                      child: GoogleButton(onPressed: () {}),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: "Nome",
        hintText: "Digite seu nome",
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Por favor, digite seu nome';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Digite seu Email",
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Por favor, digite seu email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
          return 'Por favor, digite um e-mail válido';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: "Senha",
        hintText: "Digite sua senha",
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
        if (value == null || value.trim().isEmpty) {
          return 'Por favor, digite sua senha';
        }
        _senha = value;
        return null;
      },
    );
  }

  Widget _buildPasswordConfirmationField() {
    return TextFormField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: "Confirmar senha",
        hintText: "Confirme sua senha",
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
        if (value == null || value.trim().isEmpty) {
          return 'Por favor, confirme sua senha';
        }
        if (value != _senha) {
          return 'As senhas não coincidem';
        }
        return null;
      },
    );
  }
}
