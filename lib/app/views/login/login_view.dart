import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_bloc.dart';
import '../../routes/routes.dart';
import '../../utils/form_validator.dart';
import '../../utils/snack_util.dart';
import '../../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNodeMail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _textEditingControllerEmail = TextEditingController();
  final TextEditingController _textEditingControllerPassword = TextEditingController();
  final ValueNotifier<bool> _isObscurePassword = ValueNotifier<bool>(true);

  void _onChagedObscurePassword() => _isObscurePassword.value = !_isObscurePassword.value;

  void Function() submit(BuildContext context) {
    return () {
      if (_formKey.currentState!.validate()) {
        if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationSignInEvent(email: _textEditingControllerEmail.text, password: _textEditingControllerPassword.text));
      }
    };
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationFailureState) {
              showSnack(context: context, message: state.message, color: Colors.red);
            } else if (state is AuthenticationSuccessState) {
              showSnack(context: context, message: 'Login com Sucesso!', color: Colors.green);

              AppNavigator.push(route: AppRouteName.home, args: state.user);
            }
          },
          bloc: context.read<AuthenticationBloc>(),
          builder: (context, state) => state is AuthenticationLoadingState ? const CircularProgressIndicator() : form(context)),
    ));
  }

  Widget form(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            InputWidget.mail(
                textEditingController: _textEditingControllerEmail,
                onFieldSubmitted: () {
                  if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(_focusNodePassword);
                },
                validator: FormValidator.multiValidors(validators: [FormValidator.required(), FormValidator.mail()]),
                focusNode: _focusNodeMail,
                textInputAction: TextInputAction.next),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: _isObscurePassword,
              builder: (context, value, child) => InputWidget.password(
                  textEditingController: _textEditingControllerPassword,
                  isObscure: _isObscurePassword.value,
                  changedObscure: _onChagedObscurePassword,
                  onFieldSubmitted: submit(context),
                  validator:
                      FormValidator.multiValidors(validators: [FormValidator.required(), FormValidator.min(min: 6), FormValidator.max(max: 10)]),
                  focusNode: _focusNodePassword,
                  textInputAction: TextInputAction.done),
            ),
            const SizedBox(height: 32),
            ButtonWidget(onTap: submit(context))
          ],
        ),
      ),
    );
  }
}
