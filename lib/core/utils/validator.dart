enum TaskFieldType { title, description }

abstract class Validator {
  String emptyFieldErrorMessage;
  String fieldName;
  String fieldErrorMessage;
  Validator({
    required this.emptyFieldErrorMessage,
    required this.fieldName,
    required this.fieldErrorMessage,
  });

  String? validate(String? input) {
    if (input == null || input.trim().isEmpty) {
      return '$fieldName $emptyFieldErrorMessage';
    }
    return null;
  }
}

class FullNameValidaror extends Validator {
  FullNameValidaror({
    required super.fieldName,
    required super.emptyFieldErrorMessage,
    required super.fieldErrorMessage,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    if (input!.trim().length < 6) {
      return fieldErrorMessage;
    }
    return null;
  }
}

String? taskValidator(String? input, TaskFieldType taskFieldType) {
  if (input == null || input.trim().isEmpty) {
    return 'Task ${taskFieldType.name} can\'t be empty';
  }
  return null;
}

// String? fullNameValidator(String? fullName) {
//   if (fullName == null || fullName.trim().isEmpty) {
//     return 'Full name can\'t be empty';
//   }
//   if (fullName.length < 6) {
//     return 'Full name can\'t be less than 6 chars';
//   }
//   return null;
// }
class EmailValidator extends Validator {
  EmailValidator({
    required super.fieldName,
    required super.fieldErrorMessage,
    required super.emptyFieldErrorMessage,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input!);
    if (!emailValid) {
      return fieldErrorMessage;
    }
    return null;
  }
}

// String? emailVaildator(String? email) {
//   if (email == null || email.trim().isEmpty) {
//     return 'Email can\'t be empty';
//   }
//   final bool emailValid = RegExp(
//           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(email);
//   if (!emailValid) {
//     return 'Please enter correct email';
//   }
//   return null;
// }

class PasswordValidator extends Validator {
  PasswordValidator({
    required super.emptyFieldErrorMessage,
    required super.fieldName,
    required super.fieldErrorMessage,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    if (input!.length < 6) {
      return fieldErrorMessage;
    }
    return null;
  }
}

// String? passwordValidator(String? password) {
//   if (password == null || password.trim().isEmpty) {
//     return 'Password can\'t be empty';
//   }
//   if (password.length < 6) {
//     return 'Password is too weak';
//   }
//   return null;
// }

class RePasswordValidator extends Validator {
  String password;
  RePasswordValidator({
    required super.emptyFieldErrorMessage,
    required super.fieldName,
    required super.fieldErrorMessage,
    required this.password,
  });
  @override
  String? validate(String? input) {
    String? result = super.validate(input);
    if (result != null) return result;
    if (password != input) {
      return fieldErrorMessage;
    }
    return null;
  }
}

String? rePasswordValidator({
  required String password,
  required String? rePassword,
}) {
  if (rePassword == null || rePassword.trim().isEmpty) {
    return 're-password cant\'t be empty';
  }
  if (password != rePassword) {
    return 'Password doesn\'t match';
  }
  return null;
}
