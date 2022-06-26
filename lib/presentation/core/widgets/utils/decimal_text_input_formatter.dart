import 'package:flutter/services.dart';
import 'dart:math' as math;

// TODO: support "1/2" expressions
TextInputFormatter get doubleInputFormatter =>
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));

TextInputFormatter get intInputFormatter =>
    FilteringTextInputFormatter.digitsOnly;
