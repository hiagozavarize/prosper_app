import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          padding: EdgeInsets.only(top: 10,right: 12, left: 12), 
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30), 
          decoration: BoxDecoration(
            color: Color(0xFF41EB05), 
            borderRadius: BorderRadius.all(Radius.circular(24)), 
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              navItems.length, 
              (index) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index; 
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 70, 
                      width: 46, 
                      decoration: BoxDecoration(
                        color: _selectedIndex == index ? Color(0xFFACFF88) : Colors.transparent, 
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Center(
                          child: SvgPicture.asset(
                            navItems[index],
                            width: 32,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
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
