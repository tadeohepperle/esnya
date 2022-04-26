import 'package:esnya_shared_resources/core/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class EsnyaIcons {
  static const IconData placeholder = Icons.invert_colors;

  static const IconData protein = FontAwesomeIcons.dna;
  static const IconData energy = FontAwesomeIcons.fire;

  static const IconData carbs = FontAwesomeIcons.breadSlice;
  static const IconData fat = FontAwesomeIcons.oilCan;
  static const IconData fiber =
      FontAwesomeIcons.mattressPillow; // TODO: change icons

  static final Map<NutrientType, IconData> nutrientIcons = {
    NutrientType.energy: energy,
    NutrientType.protein: protein,
    NutrientType.carbs: carbs,
    NutrientType.fat: fat,
    NutrientType.fiber: fiber,
  };
}
