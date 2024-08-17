import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prosper/utils/app_images.dart';

class Carrosel extends StatefulWidget {
  static const String screenName = '/carrosel';
  const Carrosel({super.key});

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.illustration1, fit: BoxFit.fitWidth),
          const SizedBox(height: 50),
          const Text(
            'Salve seu dinheiro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800
            ),
          ), 
        ],
      ),
    ),
    SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.illustration2, fit: BoxFit.fitWidth),
          const SizedBox(height: 50),
          const Text(
            'Cadastre seus Clientes',
            textAlign: TextAlign.center,
            style: TextStyle( 
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800
            ),
          ), 
        ],
      ),
    ),
    SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppImages.illustration3, fit: BoxFit.fitWidth),
          const SizedBox(height: 50),
          const Text(
            'Cuide da sua vida Financeira',
            textAlign: TextAlign.center,
            style: TextStyle( 
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800
            ),
          ), 
        ],
      ),
    ),
  ];
  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        ++_currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Ação quando o botão "Continuar" é pressionado na última página
      // Pode ser uma navegação para outra tela, por exemplo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 75),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: _pages,
            ),
          ),
          _buildBullets(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _nextPage, // Avança para a próxima página
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
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(_pages.length, (int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: _currentPage == index ? Colors.grey : Colors.white,
            ),
          );
        }),
      ),
    );
  }
}
