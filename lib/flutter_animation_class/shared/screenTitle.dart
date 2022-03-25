import 'dart:ffi';

import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, double value, child){
        return Opacity(opacity: value, child: Padding(
          padding: EdgeInsets.only(top: value * 30),
          child: child,
        ),);
      },
    );
  }
}
