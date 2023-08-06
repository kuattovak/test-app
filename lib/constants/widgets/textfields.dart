import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final String title;
  final IconData icon;
  final TextEditingController controller;
  PasswordTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.icon,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 336,
        height: 56,
        child: TextFormField(
          validator: (value) {
            return value != null && value.length < 6
                ? "Enter min. 6 characters"
                : null;
          },
          obscureText: obscureText,
          enabled: true,
          cursorColor: AppColors.greyDarker,
          cursorWidth: 2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: AppColors.fill,
              hintText: title),
        ));
  }
}

class UsernameTextField extends StatelessWidget {
  final bool obscureText;
  final String title;
  final IconData icon;
  final TextEditingController controller;
  UsernameTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.icon,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 336,
        height: 56,
        child: TextFormField(
          // validator: (text) {},
          obscureText: obscureText,
          enabled: true,
          cursorColor: AppColors.greyDarker,
          cursorWidth: 2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: AppColors.fill,
              hintText: title),
        ));
  }
}

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
  final bool obscureText;
  final String title;
  final IconData icon;
  final TextEditingController controller;
  EmailTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.icon,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 336,
        height: 56,
        child: TextFormField(
          validator: (value) {
            return value != null && !EmailValidator.validate(value)
                ? 'Enter a valid email'
                : null;
          },
          obscureText: obscureText,
          enabled: true,
          cursorColor: AppColors.greyDarker,
          cursorWidth: 2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: AppColors.fill,
              hintText: title),
        ));
  }
}

class SearchTextField extends StatelessWidget {
  final String title;
  final IconData icon;

  SearchTextField({
    super.key,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 336,
        height: 56,
        child: TextField(
          enabled: true,
          cursorColor: AppColors.greyDarker,
          cursorWidth: 2,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: AppColors.fill,
              hintText: title),
        ));
  }
}
