
class User {
  String firstName;
  String lastName;

  User(this.firstName, this.lastName);

  String getFullName() {
    return "$firstName $lastName";
  }
}