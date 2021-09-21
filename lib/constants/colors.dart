// Flutter imports:
import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(229, 90, 97, 1.0);
const Color secondaryColor = Color.fromRGBO(255, 197, 71, 1.0);

Map<int, Color> primaryMap = {
  50: Color.fromRGBO(229, 90, 97, 0.1),
  100: Color.fromRGBO(229, 90, 97, 0.2),
  200: Color.fromRGBO(229, 90, 97, 0.3),
  300: Color.fromRGBO(229, 90, 97, 0.4),
  400: Color.fromRGBO(229, 90, 97, 0.5),
  500: Color.fromRGBO(229, 90, 97, 0.6),
  600: Color.fromRGBO(229, 90, 97, 0.7),
  700: Color.fromRGBO(229, 90, 97, 0.8),
  800: Color.fromRGBO(229, 90, 97, 0.9),
  900: Color.fromRGBO(229, 90, 97, 1.0),
};

MaterialColor primaryMaterial = MaterialColor(primaryColor.value, primaryMap);

Map<int, Color> secondaryMap = {
  50: Color.fromRGBO(255, 197, 71, 0.1),
  100: Color.fromRGBO(255, 197, 71, 0.2),
  200: Color.fromRGBO(255, 197, 71, 0.3),
  300: Color.fromRGBO(255, 197, 71, 0.4),
  400: Color.fromRGBO(255, 197, 71, 0.5),
  500: Color.fromRGBO(255, 197, 71, 0.6),
  600: Color.fromRGBO(255, 197, 71, 0.7),
  700: Color.fromRGBO(255, 197, 71, 0.8),
  800: Color.fromRGBO(255, 197, 71, 0.9),
  900: Color.fromRGBO(255, 197, 71, 1.0),
};

MaterialColor secondaryMaterial =
    MaterialColor(secondaryColor.value, secondaryMap);
