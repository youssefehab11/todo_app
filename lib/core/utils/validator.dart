enum TaskFieldType { title, description }

String? taskValidator(String? input, TaskFieldType taskFieldType) {
  if (input == null || input.trim().isEmpty) {
    return 'Task ${taskFieldType.name} can\'t be empty';
  }
  return null;
}

String? fullNameValidator(String? fullName) {
  if (fullName == null || fullName.trim().isEmpty) {
    return 'Full name can\'t be empty';
  }
  if (fullName.length < 6) {
    return 'Full name can\'t be less than 6 chars';
  }
  return null;
}

String? emailVaildator(String? email) {
  if (email == null || email.trim().isEmpty) {
    return 'Email can\'t be empty';
  }
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) {
    return 'Please enter correct email';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.trim().isEmpty) {
    return 'Password can\'t be empty';
  }
  if (password.length < 6) {
    return 'Password is too weak';
  }
  return null;
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
