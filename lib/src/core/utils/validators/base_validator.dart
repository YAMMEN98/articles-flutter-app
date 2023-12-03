import 'package:flutter/material.dart';

abstract class BaseValidator {
  bool validate(String value);

  String getMessage(BuildContext? context);

  static String? validateValue(
    BuildContext? context,
    String value,
    List<BaseValidator> validators,
    bool isValidationActive,
  ) {
    if (!isValidationActive) return null;
    for (int i = 0; i < validators.length; i++) {
      if (!validators[i].validate(value)) {
        return validators[i].getMessage(context);
      }
    }
    return null;
  }
}
