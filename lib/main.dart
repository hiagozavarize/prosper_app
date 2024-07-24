import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prosper/gif_screen.dart';
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
        GifScreen.screenName: (_) => const GifScreen(),
        Welcome.screenName: (_) => const Welcome(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
        useMaterial3: false,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 26.0),
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
