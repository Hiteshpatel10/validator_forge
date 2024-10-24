# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

