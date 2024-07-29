import 'package:validator_forge/validator_regex_pattern.dart';

class Validators {
  static String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? customRegexValidator(String? value, String pattern, String errorMessage) {
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return errorMessage;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    return customRegexValidator(value, ValidatorRegexPattern.email, 'Invalid email address');
  }

  static String? phoneValidator(String? value) {
    return customRegexValidator(value, r'^\d{10}$', 'Invalid phone number');
  }

  static String? urlValidator(String? value) {
    return customRegexValidator(value, ValidatorRegexPattern.url, 'Invalid URL');
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? minLengthValidator(String? value, int minLength) {
    if (value == null || value.length < minLength) {
      return 'Minimum length is $minLength characters';
    }
    return null;
  }

  static String? maxLengthValidator(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'Maximum length is $maxLength characters';
    }
    return null;
  }

  static String? numberValidator(String? value) {
    return customRegexValidator(value, r'^-?\d+(\.\d+)?$', 'Invalid number');
  }

  static String? matchValidator(String? value, String? compareTo) {
    if (value != compareTo) {
      return 'Values do not match';
    }
    return null;
  }

  static String? dateValidator(String? value) {
    return customRegexValidator(value, r'^\d{4}-\d{2}-\d{2}$', 'Invalid date format (YYYY-MM-DD)');
  }

  static String? minimum(num? value, {required num min}) {
    if (value == null || value < min) {
      return 'Minimum value $min';
    }
  }

  static String? maximum(num? value, {required num max}) {
    if (value == null || value > max) {
      return 'Maximum value $max';
    }
  }
}
