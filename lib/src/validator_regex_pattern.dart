/// A class containing commonly used regular expression patterns for validation.
///
/// This class provides static constants for various regex patterns, including
/// those for email, phone number, URL, signed decimal numbers, and date format.
class ValidatorRegexPattern {
  /// Regular expression pattern for validating email addresses.
  ///
  /// This pattern checks that the email address is in the format:
  /// `localpart@domain`. The domain part must contain at least one dot (`.`).
  static const String email = r'^[^@]+@[^@]+\.[^@]+$';

  /// Regular expression pattern for validating 10-digit phone numbers.
  ///
  /// This pattern ensures that the phone number consists of exactly 10 digits,
  /// with no spaces or dashes.
  static const String phone = r'^\d{10}$';

  /// Regular expression pattern for validating URLs.
  ///
  /// This pattern validates URLs that start with either `http`, `https`, or `ftp`
  /// and ensure that the rest of the URL is in a valid format, with proper handling
  /// for special characters.
  static const String url = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';

  /// Regular expression pattern for validating signed decimal numbers.
  ///
  /// This pattern checks for both positive and negative decimal numbers, including
  /// integers and floating point numbers.
  static const String signedDecimalValidator = r'^-?\d+(\.\d+)?$';

  /// Regular expression pattern for validating dates in the format YYYY-MM-DD.
  ///
  /// This pattern ensures that the date follows the format: four digits for the
  /// year, two digits for the month, and two digits for the day (e.g., `2024-12-27`).
  static const String date = r'^\d{4}-\d{2}-\d{2}$';
}
