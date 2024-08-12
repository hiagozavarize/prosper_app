import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:loader_overlay/loader_overlay.dart";
import "package:lottie/lottie.dart";
import "package:prosper/utils/app_colors.dart";
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
  String? _confirmationPassword;

  void _submit() async {
    context.loaderOverlay.show(); // Mostrar a sobreposição

    // Simulando uma operação assíncrona
    await Future.delayed(Duration(seconds: 3));

    if (_formKey.currentState!.validate()) {
      // Aqui você pode adicionar a lógica para cadastrar a conta
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
    context.loaderOverlay.hide(); // Ocultar a sobreposição
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (progress) => Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset(
              'lib/assets/prosper_loading.json',
              fit: BoxFit.contain, 
              width: 100,
              height: 100,
            ),
        ),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackGroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(35),
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
                      SizedBox(height: 10),
                      _buildEmailField(),
                      SizedBox(height: 10),
                      _buildPasswordField(),
                      SizedBox(height: 10),
                      _buildPasswordConfirmationField(),
                      SizedBox(height: 50),
                      DefaultButton(
                        text: "Cadastrar",
                        onPressed: _submit,
                      ),
                      SizedBox(height: 15),
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
                      SizedBox(height: 20),
                      GoogleButton(onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
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
        if (value == null || value.isEmpty) {
          return 'Por favor, digite seu nome';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
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
        if (value == null || value.isEmpty) {
          return 'Por favor, digite seu email';
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
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Digite sua senha",
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white),
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
        _senha = value;
        return null;
      },
    );
  }

  Widget _buildPasswordConfirmationField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Confirmar senha",
        hintText: "Confirme sua senha",
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, confirme sua senha';
        }
        if (value != _senha) {
          return 'As senhas não coincidem';
        }
        _confirmationPassword = value;
        return null;
      },
    );
  }
}
