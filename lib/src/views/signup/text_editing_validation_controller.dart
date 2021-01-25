import 'package:flutter/material.dart';
import 'package:trackr/src/validation/null_validation_type.dart';
import 'package:trackr/src/validation/validation_type.dart';

class TextEditingValidationController extends TextEditingController {
  ValidationType _validationType = NullValidationType();

  TextEditingValidationController(this._validationType);

  /// Validates the text value based on the [ValidationType].
  ///
  /// Returns: null if valid, a string with an error message if not valid.
  String validate() => this._validationType.validate(this.text);
}
