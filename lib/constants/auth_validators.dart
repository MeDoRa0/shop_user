class AuthValidators {
  static String? userNameValidator(String? userName) {
    if (userName == null || userName.isEmpty) {
      return 'user name can`t be empty';
    }
    if (userName.length < 3 || userName.length > 15) {
      return 'user name must be between 3 and 15 character';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return 'please enter your email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(email)) {
      return 'please enter valid email';
    }
    return null;
  }

  static String? passWordValidator(String? password) {
    if (password!.isEmpty) {
      return 'please enter a password';
    }
    if (password.length < 6) {
      return ' password must be at least 6 character or more';
    }
    return null;
  }

  static String? repeatPasswordValidator(
      {String? repeatPassword, String? password}) {
    if (repeatPassword != password) {
      return ' passwords don`t match';
    }
    return null;
  }
}
