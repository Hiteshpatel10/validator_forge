# Validator Forge
Validator Forge is a Flutter package that provides a set of commonly used validation functions. It includes pre-defined validators for required fields, email, phone number, URL, passwords, and more. The package also supports custom regular expression validators.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  validator_forge: ^1.1.0
```

Then, run flutter pub get to install the package.

# Usage
To use the validators, simply import the package and use the desired validation methods.

``` 
import 'package:validator_forge/validator_forge.dart';

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) => Validators.emailValidator(value),
            onSaved: (value) => _email = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) => Validators.passwordValidator(value),
            onSaved: (value) => _password = value,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Process data.
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

```

# Validators

This package provides a comprehensive set of validation functions to ensure your forms meet various requirements. Here is a list of available validators:

-  `requiredValidator(String? value)` Ensures that the field is not empty.

- `matchRegex(String? value, String pattern, String errorMessage)`
  Validates the field against a custom regular expression.

- `emailValidator(String? value)`
  Checks if the field contains a valid email address.

- `phoneValidator(String? value)`
  Ensures the field contains a valid phone number.

- `urlValidator(String? value)`
  Verifies that the field contains a valid URL.

- `passwordValidator(String? value)`
  Ensures the field contains a password with at least 8 characters.

- `minLengthValidator(String? value, int minLength)`
  Checks that the field contains a minimum number of characters.

- `maxLengthValidator(String? value, int maxLength)`
  Verifies that the field contains a maximum number of characters.

- `numberValidator(String? value)`
  Validates that the field contains a valid number.

- `matchValidator(String? value, String? compareTo)`
  Ensures that the field matches another value.

- `dateValidator(String? value)`
  Checks if the field contains a date in the format YYYY-MM-DD.

## Validator Builder
You can use the validatorBuilder function to combine multiple validators. The function returns the first validation error it encounters.

``` 

TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  validator: (value) => validatorBuilder([
    () => Validators.requiredValidator(value),
    () => Validators.emailValidator(value),
  ]),
  onSaved: (value) => _email = value,
);

```

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue on GitHub.

## License
This project is licensed under the MIT License.# validator_forge
