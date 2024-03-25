import 'package:flutter/services.dart';

class CapitalizeFirstLetterFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      // Capitalize the first letter
      return TextEditingValue(
        text: newValue.text[0].toUpperCase() + newValue.text.substring(1),
        selection: newValue.selection,
        composing: newValue.composing,
      );
    }
    return newValue;
  }
}
