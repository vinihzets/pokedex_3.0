import 'package:flutter/material.dart';

mixin HudMixins {
  navigateThenUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  navigateRemoveUntil(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  navigateThenUntilArgs(BuildContext context, String routeName, Object args) {
    Navigator.of(context).pushNamed(routeName, arguments: args);
  }

  navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  showSnack(BuildContext context, String content, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }
}
