import 'package:flutter/material.dart';

class ExperimentButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  ExperimentButton(this.buttonText, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
