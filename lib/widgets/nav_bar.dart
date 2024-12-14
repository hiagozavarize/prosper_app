import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prosper/customers.dart';
import 'package:prosper/home.dart';
import 'package:prosper/ranking.dart';
import 'package:prosper/user_profile.dart';
import 'package:prosper/utils/app_colors.dart';

final List<String> navItems = [
  'lib/assets/home.svg',
  'lib/assets/clientes.svg',
  'lib/assets/balance.svg',
  'lib/assets/gear.svg',
];

class NavBar extends StatefulWidget {
  final int selectedIndex;
  const NavBar({super.key, this.selectedIndex = 0});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _selectedIndex;
  int? _previousIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Widget> screens = [
    HomeScreen(),
    Customers(),
    Ranking(),
    UserProfile(),
  ];

  void _onNavItemTapped(int index) {
    if (_selectedIndex == index) return;

    // Salvar o índice anterior antes de atualizar o atual
    _previousIndex = _selectedIndex;

    setState(() {
      _selectedIndex = index;
    });

    final Widget nextScreen = screens[index];

    // Verifica a direção da transição com base nos índices
    final Offset beginOffset = (_previousIndex ?? 0) < _selectedIndex
        ? Offset(1.0, 0.0) // Da direita para a esquerda
        : Offset(-1.0, 0.0); // Da esquerda para a direita

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
                .animate(animation),
            child: nextScreen,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNavBar();
  }

  Widget _buildNavBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.navBarColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              navItems.length,
              (index) => GestureDetector(
                onTap: () => _onNavItemTapped(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.only(bottom: 10),
                  margin: const EdgeInsets.only(top: 10),
                  width: 46,
                  height: 70,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? const Color(0xFFACFF88)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      navItems[index],
                      width: 32,
                      height: 32,
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
