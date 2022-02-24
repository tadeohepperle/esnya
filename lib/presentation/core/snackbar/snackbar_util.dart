import 'package:flutter/material.dart';

showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
