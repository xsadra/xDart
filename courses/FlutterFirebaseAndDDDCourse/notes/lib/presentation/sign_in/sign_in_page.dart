import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:notes/injection.dart';
import 'package:notes/presentation/sign_in/widgets/sign_in_form.dart';

//? Step 26: create SignInPage
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
