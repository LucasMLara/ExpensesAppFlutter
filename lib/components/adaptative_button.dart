import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Colors.white,
            child: Text(label),
            onPressed: onPressed,
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}
