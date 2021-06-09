import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton(
      {required this.image,
      required this.text,
      required this.buttonstyle,
      required this.radius,
      required this.onPressed});

  final Widget image;
  final Widget text;
  final ButtonStyle buttonstyle;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            text,
            Opacity(
              opacity: 0.0,
              child: image,
            ),
          ],
        ),
        style: buttonstyle,
        onPressed: onPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
