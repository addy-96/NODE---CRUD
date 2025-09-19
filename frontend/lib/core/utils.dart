  import 'package:flutter/material.dart';

showSnack(String message, Color color,BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }