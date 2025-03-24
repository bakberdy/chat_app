String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty.';
  }

  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address.';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty.';
  }

  if (value.length < 6) {
    return 'Password must be at least 8 characters long.';
  }

  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password.';
  }

  if (value != password) {
    return 'Passwords do not match.';
  }

  return null;
}


String? validateName(String? value) {
  final RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]*$');

  if (value == null || value.isEmpty) {
    return 'This field cannot be empty.';
  }

  if (!nameRegExp.hasMatch(value)) {
    return 'Must start with a capital letter and contain only letters.';
  }

  return null; 
}
