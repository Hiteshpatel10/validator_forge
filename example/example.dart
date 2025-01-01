import 'package:validator_forge/validator_forge.dart';

void main() {
  // Example 1: Email Validation using ValidationBuilder
  var emailValidation = ValidationBuilder()
      .required('Email is required')
      .email('Invalid email address')
      .build('invalid-email.com');
  print('Email validation: ${emailValidation ?? "Email is valid!"}\n'); // Should print error message

  // Example 2: Phone Validation using ValidationBuilder (10 digits)
  var phoneValidation = ValidationBuilder()
      .required('Phone number is required')
      .phone('Invalid phone number')
      .build('1234567890');
  print('Phone validation: ${phoneValidation ?? "Phone number is valid!"}\n'); // Should print valid

  // Example 3: Password Validation using ValidationBuilder (Minimum length 8 characters)
  var passwordValidation = ValidationBuilder()
      .required('Password is required')
      .password('Password must be at least 8 characters long')
      .build('pass123');
  print('Password validation: ${passwordValidation ?? "Password is valid!"}\n'); // Should print error message

  // Example 4: Date Validation using ValidationBuilder (YYYY-MM-DD format)
  var dateValidation = ValidationBuilder()
      .required('Date is required')
      .date('Invalid date format (YYYY-MM-DD)')
      .build('2024-12-31');
  print('Date validation: ${dateValidation ?? "Date is valid!"}\n'); // Should print valid

  // Example 5: Number Validation using direct Validator (e.g., a minimum of 10)
  String? numberValidation = Validators.minimum(5, 10, errorMessage: 'Value must be at least 10');
  print('Number validation: ${numberValidation ?? "Number is valid!"}\n'); // Should print error message

  // Example 6: Matching two values (e.g., password confirmation) using direct Validator
  String? matchValidation = Validators.match('password123', 'password123', errorMessage: 'Passwords do not match');
  print('Match validation: ${matchValidation ?? "Passwords match!"}\n'); // Should print valid

  // Example 7: Max Length Validation using direct Validator
  String? maxLengthValidation = Validators.maxLength('This is a long string', 10, errorMessage: 'Maximum length is 10');
  print('Max length validation: ${maxLengthValidation ?? "Input is valid!"}\n'); // Should print error message
}
