import 'package:trackr/src/model/data_item.dart';

class User extends DataItem {
  int id;
  String firstName;
  String lastName;
  String userName;

  User({this.firstName, this.lastName, this.userName});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'username': userName,
    };
  }
}
