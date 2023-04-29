import 'package:flutter/material.dart';

class ContainerGradientWidget {
  static build(Color firstColor, Color secondColor, Widget? child) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          firstColor,
          secondColor,
        ],
      )),
      child: child,
    );
  }
}
