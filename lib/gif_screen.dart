import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:prosper/utils/app_images.dart';
import 'package:prosper/welcome.dart';

class GifScreen extends StatefulWidget {
  static const String screenName = "/gif";
  const GifScreen({super.key});

  @override
  _GifScreenState createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2800), () {
      Navigator.of(context).pushReplacementNamed(Welcome.screenName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 230,
          child: Image.asset(
            AppImages.gifProsper, 
            fit: BoxFit.cover,
          ).animate().fadeIn(duration: const Duration(seconds: 3)), 
        )
      ),
    );
  }
}
