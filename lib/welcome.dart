import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prosper/carrosel.dart';
import 'utils/utils.dart';

class Welcome extends StatelessWidget {
  static const String screenName = "/welcome";
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Image.asset(
                AppImages.logoProsper,
                width: 102,
                height: 158,
              ),
              const SizedBox(height: 80),
              const Text(
                'Bem Vindo ao ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'Prosper',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 200),
              ElevatedButton(
                onPressed: () {
                  navigatorKey.currentState!.pushNamed(Carrosel.screenName);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Continuar',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
