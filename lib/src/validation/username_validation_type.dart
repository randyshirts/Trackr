import 'validation_type.dart';

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
