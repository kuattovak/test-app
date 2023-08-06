import 'package:flutter/material.dart';

import '../colors/colors.dart';

class MainButton extends StatelessWidget {
  final Text title;
  final Color color;
  final Border border;
  final Function() route;

  MainButton(
      {required this.title,
      required this.color,
      required this.border,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Container(
          width: 336,
          height: 56,
          decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.circular(12)),
          child: Center(child: title)),
    );
  }
}

class TextButtons extends StatelessWidget {
  final String title;
  final Function() onPressed;

  TextButtons({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(color: AppColors.main),
      ),
    );
  }
}
