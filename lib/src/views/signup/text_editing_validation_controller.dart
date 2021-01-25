import 'package:flutter/material.dart';

class TextEditingValidationController extends TextEditingController {
  ValidationType _validationType = NullValidationType();

  TextEditingValidationController(this._validationType);

  /// Validates the text value based on the [ValidationType].
  ///
  /// Returns: null if valid, a string with an error message if not valid.
  String validate() => this._validationType.validate(this.text);
}

class ValidationTypes {
  ValidationTypes._();

  static ValidationType name = NameValidationType();
  static ValidationType username = UsernameValidationType();
  static ValidationType password = PasswordValidationType();
}

abstract class ValidationType {
  String validate(String value);
}

class NameValidationType extends ValidationType {
  static final validCharacters = RegExp(r"^[a-zA-Z'\ ]+$");

  @override
  String validate(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (!validCharacters.hasMatch(value)) {
      return "Hey Silly, names don't have special characters (!@#%^&...) or numbers";
    }

    return null;
  }
}

class UsernameValidationType extends ValidationType {
  static final validCharacters = RegExp(r"^[a-zA-Z0-9]+$");

  @override
  String validate(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (!validCharacters.hasMatch(value)) {
      return "Good try, usernames don't have special characters (!@#%^&...) or spaces";
    }

    return null;
  }
}

class PasswordValidationType extends ValidationType {
  static final validCharacters = RegExp(r"^[a-zA-Z0-9;:?.,!@#$]+$^&*~");

  @override
  String validate(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (!validCharacters.hasMatch(value)) {
      return "Good try, passwords can't have spaces or some special characters (;:',{}<>%\)";
    }

    return null;
  }
}

class NullValidationType extends ValidationType {
  @override
  String validate(String value) {
    return "Invalid controller";
  }
}
