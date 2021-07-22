import 'package:flutter/cupertino.dart' show FormFieldValidator;

class FormValidator {
  FormValidator._();

  static FormFieldValidator<String> required({String message = 'Campo obrigatório!'}) {
    return (String? value) {
      if (!(value != null && value.isNotEmpty)) return message;
      return null;
    };
  }

  static FormFieldValidator<String> max({required int max, String message = 'Máximo de caracteres alcançado!'}) {
    return (String? value) {
      if (value != null && value.isNotEmpty && value.length > max) return message;
      return null;
    };
  }

  static FormFieldValidator<String> min({required int min, String message = 'Mínimo de caracteres alcançado!'}) {
    return (String? value) {
      if (value != null && value.isNotEmpty && value.length < min) return message;
      return null;
    };
  }

  static FormFieldValidator<String> mail({String message = 'E-mail inválido!'}) {
    return (String? value) {
      if (value != null && value.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
        return message;
      }
      return null;
    };
  }

  static FormFieldValidator<String> multiValidors({required List<FormFieldValidator<String>> validators}) {
    return (String? value) {
      for (final FormFieldValidator<String> validator in validators) {
        final String? res = validator(value);
        if (res != null) return res;
      }
      return null;
    };
  }
}
