import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prosper/account_registration.dart';
import 'package:prosper/carrosel.dart';
import 'package:prosper/gif_screen.dart';
import 'package:prosper/login.dart';
import 'package:prosper/widgets/nav_bar.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/common.dart';
import 'package:prosper/welcome.dart';

void main() {
  runApp(const ProsperApp());
}

class ProsperApp extends StatelessWidget {
  const ProsperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: GifScreen.screenName,
      routes: {
        //colocar todas rotas para as outras páginas aqui:
        GifScreen.screenName: (_) => const GifScreen(),
        Welcome.screenName: (_) => const Welcome(),
        Carrosel.screenName: (_) => const Carrosel(),
        LoginPage.screenName: (_) => const LoginPage(),
        AccountRegistration.screenName: (_) => AccountRegistration(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
        useMaterial3: false,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            textStyle: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

