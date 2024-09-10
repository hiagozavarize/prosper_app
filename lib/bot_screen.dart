import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prosper/utils/app_colors.dart';
import 'package:prosper/utils/app_images.dart';

class BotScreen extends StatelessWidget {
  static const String screenName = "/bot";
  const BotScreen({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          AppImages.fundo
        ), 
        fit: BoxFit.cover,
      ), 
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.botImg,
              height: 30,
            ),
            const SizedBox(width: 5),
            const Text(
              'BOT',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ]
        ),
        centerTitle: true,

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ,
    ),
  );
}