import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prosper/utils/app_colors.dart';

const Color navBarColor = Color(0xFF41EB05);

final List<String> navItems = [
  'lib/assets/home.svg',
  'lib/assets/clientes.svg',
  'lib/assets/balance.svg',
  'lib/assets/gear.svg',
];

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

// Estado da barra de navegação
class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0; // Mudado para int em vez de final

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: 46 * 18, // Largura total da barra
          height: 70,     // Altura total da barra
          decoration: BoxDecoration(
            color: navBarColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              navItems.length,
              (index) => GestureDetector(
                onTap: () => _onNavItemTapped(index),
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  margin: EdgeInsets.only(top: 10),
                  width: 46,
                  height: 70, // Altura da caixa de seleção
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Color(0xFFACFF88)
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ), // Ajuste o valor conforme necessário
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      navItems[index],
                      width: 32, // Largura do ícone
                      height: 32, // Altura do ícone para garantir proporção fixa
                      fit: BoxFit.contain,
                      
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}