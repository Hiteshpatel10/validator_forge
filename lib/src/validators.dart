import 'package:validator_forge/src/validator_regex_pattern.dart';

/// A class containing various static validation methods.
///
/// This class provides common validation methods for validating fields such as:
/// required, email, phone number, URL, password, numeric values, dates, and more.
class Validators {
  /// Validator for required fields.
  ///
  /// This validation ensures that the field is not null or empty.
  /// If the value is empty, an error message will be returned.
  /// You can provide a custom error message, otherwise, a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.required(''); // Returns 'This field is required'
  /// ```
  static String? required(String? value, {String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'This field is required';
    }
    return null;
  }

  /// Validator for matching custom regular expressions.
  ///
  /// This method checks if the input value matches the specified regular expression pattern.
  /// You can provide a custom error message; otherwise, a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.matchRegex('example@domain.com', r'^[^@]+@[^@]+\.[^@]+$');
  /// ```
  static String? matchRegex(String? value, String pattern, {String? errorMessage}) {
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return errorMessage ?? 'Invalid input';
    }
    return null;
  }

  /// Validator for email format.
  ///
  /// This validation checks if the input value is a valid email address using the [email] regex pattern.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.email('example@domain.com'); // Returns null (valid email)
  /// ```
  static String? email(String? value, {String? errorMessage}) {
    return matchRegex(value, ValidatorRegexPattern.email,
        errorMessage: errorMessage ?? 'Invalid email address');
  }

  /// Validator for phone number (10 digits).
  ///
  /// This validation ensures the phone number is exactly 10 digits long.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.phone('1234567890'); // Returns null (valid phone number)
  /// ```
  static String? phone(String? value, {String? errorMessage}) {
    return matchRegex(value, r'^\d{10}$',
        errorMessage: errorMessage ?? 'Invalid phone number');
  }

  /// Validator for URLs.
  ///
  /// This validation checks if the input value is a valid URL starting with `http`, `https`, or `ftp`.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.url('http://example.com'); // Returns null (valid URL)
  /// ```
  static String? url(String? value, {String? errorMessage}) {
    return matchRegex(value, ValidatorRegexPattern.url,
        errorMessage: errorMessage ?? 'Invalid URL');
  }

  /// Validator for password length (min 8 characters).
  ///
  /// This validation ensures the password is at least 8 characters long.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.password('mypassword'); // Returns null (valid password)
  /// ```
  static String? password(String? value, {String? errorMessage}) {
    if (value == null || value.length < 8) {
      return errorMessage ?? 'Password must be at least 8 characters long';
    }
    return null;
  }

  /// Validator for minimum length.
  ///
  /// This validation checks that the input value's length is greater than or equal to the specified [minLength].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.minLength('short', 6); // Returns 'Minimum length is 6 characters'
  /// ```
  static String? minLength(String? value, int minLength, {String? errorMessage}) {
    if (value == null || value.length < minLength) {
      return errorMessage ?? 'Minimum length is $minLength characters';
    }
    return null;
  }

  /// Validator for maximum length.
  ///
  /// This validation checks that the input value's length is less than or equal to the specified [maxLength].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.maxLength('longinputstring', 10); // Returns 'Maximum length is 10 characters'
  /// ```
  static String? maxLength(String? value, int maxLength, {String? errorMessage}) {
    if (value != null && value.length > maxLength) {
      return errorMessage ?? 'Maximum length is $maxLength characters';
    }
    return null;
  }

  /// Validator for numeric values.
  ///
  /// This validation checks if the input value is a valid signed decimal number (positive or negative).
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.number('123.45'); // Returns null (valid number)
  /// ```
  static String? number(String? value, {String? errorMessage}) {
    return matchRegex(
      value,
      ValidatorRegexPattern.signedDecimalValidator,
      errorMessage: errorMessage ?? 'Invalid number',
    );
  }

  /// Validator to check if two values match.
  ///
  /// This validation ensures that the two values are equal. If they don't match, an error message is returned.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.match('password123', 'password123'); // Returns null (values match)
  /// ```
  static String? match<T>(T? value, T? compareTo, {String? errorMessage}) {
    if (value != compareTo) {
      return errorMessage ?? 'Values do not match';
    }
    return null;
  }

  /// Validator for date format (YYYY-MM-DD).
  ///
  /// This validation checks if the input value follows the format YYYY-MM-DD.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.date('2024-12-27'); // Returns null (valid date format)
  /// ```
  static String? date(String? value, {String? errorMessage}) {
    return matchRegex(
      value,
      ValidatorRegexPattern.date,
      errorMessage: errorMessage ?? 'Invalid date format (YYYY-MM-DD)',
    );
  }

  /// Validator for minimum numeric value.
  ///
  /// This validation ensures that the numeric value is greater than or equal to the specified [min].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.minimum(5, 10); // Returns 'Minimum value is 10'
  /// ```
  static String? minimum(num? value, num min, {String? errorMessage}) {
    if (value == null || value < min) {
      return errorMessage ?? 'Minimum value is $min';
    }
    return null;
  }

  /// Validator for maximum numeric value.
  ///
  /// This validation ensures that the numeric value is less than or equal to the specified [max].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// Validators.maximum(50, 100); // Returns null (valid value)
  /// ```
  static String? maximum(num? value, num max, {String? errorMessage}) {
    if (value == null || value > max) {
      return errorMessage ?? 'Maximum value is $max';
    }
    return null;
  }
}
