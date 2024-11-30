import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prosper/customer_profile.dart';
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

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onNavItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    // Navegação condicional baseada no índice
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, HomeScreen.screenName);
        break;
      case 1:
        // Navigator.pushReplacementNamed(context, CustomerProfile.screenName); // Adicione a rota correta aqui
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Ranking.screenName);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, UserProfile.screenName);
        break;
      default:
        break;
    }
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
