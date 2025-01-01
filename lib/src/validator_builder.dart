import 'package:validator_forge/src/validators.dart';

/// A builder class for chaining validation methods in a fluent interface.
///
/// The [ValidationBuilder] class allows the chaining of multiple validation
/// methods for a given input. It provides various built-in validators like
/// required, minLength, maxLength, email, etc., and allows users to add custom
/// error messages for each validation.
class ValidationBuilder {
  /// Creates an instance of [ValidationBuilder].
  ValidationBuilder();

  final List<String? Function(String?)> _validators = [];

  /// Adds a required validation to the builder.
  ///
  /// This validation ensures that the input is not null or empty.
  /// You can provide a custom error message; otherwise, a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().required("This field cannot be empty");
  /// ```
  ValidationBuilder required([String? errorMessage]) {
    _validators.add(
      (value) => Validators.required(
        value,
        errorMessage: errorMessage,
      ),
    );
    return this;
  }

  /// Adds a minimum length validation to the builder.
  ///
  /// This validation ensures that the input length is at least the specified [length].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().minLength(8, "Password must be at least 8 characters");
  /// ```
  ValidationBuilder minLength(int length, [String? errorMessage]) {
    _validators.add(
      (value) => Validators.minLength(
        value,
        length,
        errorMessage: errorMessage ?? 'Minimum length is $length',
      ),
    );
    return this;
  }

  /// Adds a maximum length validation to the builder.
  ///
  /// This validation ensures that the input length is at most the specified [length].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().maxLength(15, "Input too long");
  /// ```
  ValidationBuilder maxLength(int length, [String? errorMessage]) {
    _validators.add(
      (value) => Validators.maxLength(
        value,
        length,
        errorMessage: errorMessage ?? 'Maximum length is $length',
      ),
    );
    return this;
  }

  /// Adds an email validation to the builder.
  ///
  /// This validation checks if the input is a valid email address.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().email("Invalid email format");
  /// ```
  ValidationBuilder email([String? errorMessage]) {
    _validators.add(
      (value) => Validators.email(
        value,
        errorMessage: errorMessage ?? 'Invalid email address',
      ),
    );
    return this;
  }

  /// Adds a phone validation to the builder.
  ///
  /// This validation checks if the input is a valid phone number.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().phone("Invalid phone number format");
  /// ```
  ValidationBuilder phone([String? errorMessage]) {
    _validators.add(
      (value) => Validators.phone(
        value,
        errorMessage: errorMessage ?? 'Invalid phone number',
      ),
    );
    return this;
  }

  /// Adds a password validation to the builder.
  ///
  /// This validation ensures that the password is at least 8 characters long.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().password("Password too short");
  /// ```
  ValidationBuilder password([String? errorMessage]) {
    _validators.add(
      (value) => Validators.password(
        value,
        errorMessage:
            errorMessage ?? 'Password must be at least 8 characters long',
      ),
    );
    return this;
  }

  /// Adds a regex match validation to the builder.
  ///
  /// This validation ensures that the input matches the given [pattern].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().matchRegex(r"^\d{4}$", "Invalid year format");
  /// ```
  ValidationBuilder matchRegex(String pattern, [String? errorMessage]) {
    _validators.add(
      (value) => Validators.matchRegex(
        value,
        pattern,
        errorMessage: errorMessage ?? 'Invalid input',
      ),
    );
    return this;
  }

  /// Adds a date validation to the builder.
  ///
  /// This validation checks if the input is in the format YYYY-MM-DD.
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().date("Invalid date format (YYYY-MM-DD)");
  /// ```
  ValidationBuilder date([String? errorMessage]) {
    _validators.add(
      (value) => Validators.date(
        value,
        errorMessage: errorMessage ?? 'Invalid date format (YYYY-MM-DD)',
      ),
    );
    return this;
  }

  /// Adds a minimum value validation to the builder.
  ///
  /// This validation ensures that the input value is greater than or equal to the specified [min].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().minimum(10, "Value must be at least 10");
  /// ```
  ValidationBuilder minimum(num min, [String? errorMessage]) {
    _validators.add(
      (value) => Validators.minimum(
        num.tryParse(value ?? ''),
        min,
        errorMessage: errorMessage ?? 'Minimum value is $min',
      ),
    );
    return this;
  }

  /// Adds a maximum value validation to the builder.
  ///
  /// This validation ensures that the input value is less than or equal to the specified [max].
  /// A custom error message can be provided, otherwise a default message will be used.
  ///
  /// Example:
  /// ```dart
  /// ValidationBuilder().maximum(100, "Value cannot exceed 100");
  /// ```
  ValidationBuilder maximum(num max, [String? errorMessage]) {
    _validators.add(
      (value) => Validators.maximum(
        num.tryParse(value ?? ''),
        max,
        errorMessage: errorMessage ?? 'Maximum value is $max',
      ),
    );
    return this;
  }

  /// Builds the final validation logic and returns the first error encountered.
  ///
  /// This method runs all the added validators on the provided [value].
  /// If a validator returns a non-null error message, that message is returned
  /// and no further validation is performed. If no errors are found, `null` is returned.
  ///
  /// Example:
  /// ```dart
  /// final result = ValidationBuilder()
  ///     .required()
  ///     .minLength(8)
  ///     .build("short");
  /// print(result); // Output: "Minimum length is 8"
  /// ```
  String? build(String? value) {
    for (var validator in _validators) {
      final result = validator(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
