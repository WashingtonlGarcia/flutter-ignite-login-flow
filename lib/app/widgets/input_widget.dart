import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends TextFormField {
  InputWidget(
      {required void Function() onFieldSubmitted,
      required String? Function(String?) validator,
      required TextInputType textInputType,
      required TextEditingController textEditingController,
      //   required void Function(String?) onChanged,
      required String placeholder,
      required IconData icon,
      required FocusNode focusNode,
      required TextInputAction textInputAction,
      List<TextInputFormatter>? inputFormatters = const []})
      : super(
          controller: textEditingController,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // onChanged: onChanged,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(),
          ),
        );

  InputWidget.mail(
      {required void Function() onFieldSubmitted,
      required String? Function(String?) validator,
      required TextEditingController textEditingController,
      // required void Function(String?) onChanged,
      required FocusNode focusNode,
      required TextInputAction textInputAction,
      List<TextInputFormatter>? inputFormatters = const []})
      : super(
          controller: textEditingController,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //  onChanged: onChanged,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.emailAddress,
          textInputAction: textInputAction,
          decoration: const InputDecoration(
            hintText: 'E-mail',
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
          ),
        );

  InputWidget.password(
      {required bool isObscure,
      required void Function() changedObscure,
      required void Function() onFieldSubmitted,
      required String? Function(String?) validator,
      required FocusNode focusNode,
      required TextEditingController textEditingController,
      // required void Function(String?) onChanged,
      required TextInputAction textInputAction,
      List<TextInputFormatter>? inputFormatters = const []})
      : super(
          controller: textEditingController,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // onChanged: onChanged,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.visiblePassword,
          obscureText: isObscure,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: 'Senha',
            prefixIcon: const Icon(Icons.https),
            suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: changedObscure,
            ),
            border: const OutlineInputBorder(),
          ),
        );
}
