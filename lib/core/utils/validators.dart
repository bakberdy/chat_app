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

String? validateDate(String? input) {
    if (input == null || input.length < 10) return 'Please enter full date';

    try {
      final parts = input.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      // Basic date validation
      if (day < 1 || day > 31) return 'Invalid day';
      if (month < 1 || month > 12) return 'Invalid month';

      final enteredDate = DateTime(year, month, day);
      final now = DateTime.now();
      final hundredYearsAgo = DateTime(now.year - 100, now.month, now.day);

      if (enteredDate.isAfter(now)) {
        return 'Date cannot be in the future';
      }

      if (enteredDate.isBefore(hundredYearsAgo)) {
        return 'Date cannot be older than 100 years';
      }

      return null;
    } catch (e) {
      return 'Invalid date format';
    }
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
