# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2024-12-27

### Added
- **Refactored Code Structure**:
    - Introduced a modular folder structure for better organization and maintainability:
        - **`src/validator_regex_pattern.dart`**: Moved all regex patterns (email, phone, date, etc.) into a dedicated file `validator_regex_pattern.dart`.
        - **`src/validation_builder.dart`**: Moved the `ValidationBuilder` class into a separate file `validation_builder.dart` for easier usage and customization.
        - **`src/validators.dart`**: Core validation logic is now housed in `validators.dart`, utilizing regex patterns from `ValidatorRegexPattern`.

- **Improved Validation Logic**:
    - Centralized all regex patterns in the `ValidatorRegexPattern` class to improve code reusability and maintainability.
    - Refactored the `ValidationBuilder` class to enable easier chaining of validators and better error message handling.

### Changed
- **Code Refactoring**:
    - Refactored the validation logic to reference regex patterns from the `ValidatorRegexPattern` class, moving away from hardcoding them directly in the `Validators` class.
    - Reorganized the codebase by relocating the validation builder to the `builder` folder and the core validation logic to the `validator` folder for clearer structure.

- **Updated Validation Flow**:
    - The `ValidationBuilder` class now supports easier chaining of validation methods, such as `minLength`, `maxLength`, `email`, and `phone`, for more flexible and efficient validation compositions.

### Fixed
- N/A (No specific bug fixes in this release)

### Breaking Changes
- The new modular folder structure may break backward compatibility. You will need to update your imports to match the new file paths:
    - `import 'package:validator_forge/src/validator_regex_pattern.dart';` for regex patterns.
    - `import 'package:validator_forge/src/validation_builder.dart';` for `ValidationBuilder`.
    - `import 'package:validator_forge/src/validators.dart';` for core validators.

## [1.0.0] - 2024-10-19

### Added
- Initial release of **Validator Forge** package.
- Implemented core validators for:
    - Required fields (`Validators.required`)
    - Email format validation (`Validators.email`)
    - Phone number validation (10 digits) (`Validators.phone`)
    - URL validation (`Validators.url`)
    - Custom regex pattern matching (`Validators.matchRegex`)
    - Password length validation (minimum 8 characters) (`Validators.password`)
    - Minimum length validation (`Validators.minLength`)
    - Maximum length validation (`Validators.maxLength`)
    - Numeric validation (`Validators.number`)
    - Date format validation (`Validators.date`)
    - Minimum numeric value validation (`Validators.minimum`)
    - Maximum numeric value validation (`Validators.maximum`)
    - Field matching (`Validators.match`)

- Added `ValidatorRegexPattern` class for common regex patterns (email, URL, signed decimal).
- Introduced `validatorBuilder` function to compose multiple validators.

### Fixed
- N/A (Initial release)

### Changed
- N/A (Initial release)
