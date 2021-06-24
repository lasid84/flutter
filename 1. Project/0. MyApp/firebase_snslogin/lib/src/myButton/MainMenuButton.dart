import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  // get title => null;
  // get onPressed => null;

  renderTextBtn(String title, var onPress) {
    //renderTextBtn();
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.grey,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            }
            // else {
            //   return Colors.orange;
            // }
          },
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            width: 2,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Text(title),
    );
  }

  renderOutlinedBtn(String title, var onPress) {
    //renderTextBtn();
    return OutlinedButton(
      onPressed: onPress,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.grey,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.green;
            }
            // else {
            //   return Colors.orange;
            // }
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red),
          ),
        ),

      ),
      child: Text(title),
    );
  }

  renderElevatedBtn(String title, var onPress) {
    //renderTextBtn();
    return ElevatedButton(
      onPressed: onPress,
      // style: ButtonStyle(
      //   foregroundColor: MaterialStateProperty.all(
      //     Colors.grey,
      //   ),
      //   backgroundColor: MaterialStateProperty.resolveWith(
      //         (states) {
      //       if (states.contains(MaterialState.pressed)) {
      //         return Colors.green;
      //       } else {
      //         return Colors.orange;
      //       }
      //     },
      //   ),
      // ),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
