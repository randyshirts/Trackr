import 'name_validation_type.dart';
import 'password_validation_type.dart';
import 'username_validation_type.dart';

abstract class ValidationType {
  String validate(String value);
}

class ValidationTypes {
  ValidationTypes._();

  static ValidationType name = NameValidationType();
  static ValidationType username = UsernameValidationType();
  static ValidationType password = PasswordValidationType();
}
