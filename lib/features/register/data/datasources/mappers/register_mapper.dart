class RegisterMapper {
  String email;
  String username;

  RegisterMapper(this.email, this.username);

  toMap() {
    return {
      'email': email,
      'username': username,
    };
  }
}
