import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_bloc.dart';
import '../../data/models/user_model.dart';
import '../../routes/app_navigator.dart';
import '../../utils/snack_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late UserModel? user;

  @override
  void didChangeDependencies() {
    user = ModalRoute.of(context)?.settings.arguments as UserModel?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationFailureState) {
                showSnack(context: context, message: state.message, color: Colors.red);
              } else if (state is AuthenticationSuccessSignOutState) {
                AppNavigator.pop();
              }
            },
            builder: (context, state) => AppBar(
              title: Text('Bem vindo ${user?.email ?? user?.displayName ?? user?.id}'),
              automaticallyImplyLeading: false,
              actions: [
                Visibility(
                  visible: state is! AuthenticationLoadingState,
                  child: IconButton(
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(AuthenticationSignOutEvent());
                      },
                      icon: const Icon(Icons.logout)),
                )
              ],
            ),
          ),
        ),
        body: Container());
  }
}
