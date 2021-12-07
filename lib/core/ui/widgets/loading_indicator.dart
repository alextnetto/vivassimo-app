import 'package:flutter/material.dart';

class LoadingIndicator {
  static void show(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
