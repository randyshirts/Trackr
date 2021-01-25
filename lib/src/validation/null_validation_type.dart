import 'validation_type.dart';

class NullValidationType extends ValidationType {
  @override
  String validate(String value) {
    return "Invalid controller";
  }
}
