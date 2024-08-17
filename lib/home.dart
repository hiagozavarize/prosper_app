import "package:flutter/material.dart";
import "package:prosper/utils/app_colors.dart";
import "package:prosper/utils/app_images.dart";

class HomeScreen extends StatefulWidget {
  static const String screenName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text("Olá, [usuário]!"),
          leading: Image.asset(AppImages.logoProsper),
          actions: [],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(35),
          child: Column(
            
          ),
        ));
  }
}
