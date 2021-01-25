import 'validation_type.dart';

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
