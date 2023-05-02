import 'dart:developer';

class StringTranslate {
  static convert(String content) {
    if (content == 'The email address is badly formatted.') {
      return 'Email mal formatado';
    } else if (content == 'Given String is empty or null') {
      return 'Campo Vazio';
    } else if (content ==
        'The password is invalid or the user does not have a password.') {
      return 'Senha Incorreta';
    } else if (content ==
        'There is no user record corresponding to this identifier. The user may have been deleted.') {
      return 'Usuario nao encontrado';
    } else {
      return '';
    }
  }
}
