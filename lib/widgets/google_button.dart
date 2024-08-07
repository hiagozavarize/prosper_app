import "package:flutter/material.dart";
import "package:prosper/utils/app_images.dart";

class GoogleButton extends StatelessWidget {
  
  final VoidCallback onPressed;
  
  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(AppImages.googleLogo, 
          width: 30,
          height: 30,),
        ),
      ),
    );
  }
}