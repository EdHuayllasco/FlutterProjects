import 'package:flutter/material.dart';

// si pones con guion bajo puedes utilizarlas unicamente en ese archivo. o privado
const Color _customColor = Color.fromARGB(255, 76, 21, 164);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  AppTheme({
    required this.selectedColor
  }):assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,'selectedColor must be between 0 and ${_colorThemes.length - 1}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}
