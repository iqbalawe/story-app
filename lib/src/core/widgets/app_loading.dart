import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: color != null
            ? AlwaysStoppedAnimation<Color>(color!)
            : null,
      ),
    );
  }
}
