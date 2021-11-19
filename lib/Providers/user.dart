/* Class để chứa thông tin về 1 User */
class User {
  final String username;
  final String password;
  bool isLoggedin;

  User({
    required this.username,
    required this.password,
    this.isLoggedin = false,
  });
}
