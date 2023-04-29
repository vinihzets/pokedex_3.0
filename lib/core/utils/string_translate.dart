class StringTranslate {
  static convert(String content) {
    if (content == 'The email address is badly formatted.') {
      return 'Email mal formatado';
    } else if (content == 'Given String is empty or null') {
      return 'Campo Vazio';
    } else if (content ==
        'The password is invalid or the user does not have a password.') {
      return 'Senha Incorreta';
    } else {
      return '';
    }
  }
}
