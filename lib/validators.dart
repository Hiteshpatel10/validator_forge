import 'package:validator_forge/validator_regex_pattern.dart';

class Validators {
  // Validator for required fields
  static String? required(String? value, {String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'This field is required';
    }
    return null;
  }

  // Validator for matching custom regular expressions
  static String? matchRegex(String? value, String pattern, {String? errorMessage}) {
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return errorMessage ?? 'Invalid input';
    }
    return null;
  }

  // Validator for email format
  static String? email(String? value, {String? errorMessage}) {
    return matchRegex(value, ValidatorRegexPattern.email, errorMessage: errorMessage ?? 'Invalid email address');
  }

  // Validator for phone number (10 digits)
  static String? phone(String? value, {String? errorMessage}) {
    return matchRegex(value, r'^\d{10}$', errorMessage: errorMessage ?? 'Invalid phone number');
  }

  // Validator for URLs
  static String? url(String? value, {String? errorMessage}) {
    return matchRegex(value, ValidatorRegexPattern.url, errorMessage: errorMessage ?? 'Invalid URL');
  }

  // Validator for password length (min 8 characters)
  static String? password(String? value, {String? errorMessage}) {
    if (value == null || value.length < 8) {
      return errorMessage ?? 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Validator for minimum length
  static String? minLength(String? value, int minLength, {String? errorMessage}) {
    if (value == null || value.length < minLength) {
      return errorMessage ?? 'Minimum length is $minLength characters';
    }
    return null;
  }

  // Validator for maximum length
  static String? maxLength(String? value, int maxLength, {String? errorMessage}) {
    if (value != null && value.length > maxLength) {
      return errorMessage ?? 'Maximum length is $maxLength characters';
    }
    return null;
  }

  // Validator for numeric values
  static String? number(String? value, {String? errorMessage}) {
    return matchRegex(value, ValidatorRegexPattern.signedDecimalValidator, errorMessage: errorMessage ?? 'Invalid number');
  }

  // Validator to check if two values match
  static String? match<T>(T? value, T? compareTo, {String? errorMessage}) {
    if (value != compareTo) {
      return errorMessage ?? 'Values do not match';
    }
    return null;
  }

  // Validator for date format (YYYY-MM-DD)
  static String? date(String? value, {String? errorMessage}) {
    return matchRegex(value, r'^\d{4}-\d{2}-\d{2}$', errorMessage: errorMessage ?? 'Invalid date format (YYYY-MM-DD)');
  }

  // Validator for minimum numeric value
  static String? minimum(num? value, num min, {String? errorMessage}) {
    if (value == null || value < min) {
      return errorMessage ?? 'Minimum value is $min';
    }
    return null;
  }

  // Validator for maximum numeric value
  static String? maximum(num? value, num max, {String? errorMessage}) {
    if (value == null || value > max) {
      return errorMessage ?? 'Maximum value is $max';
    }
    return null;
  }
}
