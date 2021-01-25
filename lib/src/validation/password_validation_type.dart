import 'validation_type.dart';

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
