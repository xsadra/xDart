import 'package:auto_route/auto_route.dart' as r;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/application/auth/auth_bloc.dart';
import 'package:notes/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:notes/presentation/routes/router.gr.dart';

//? Step 27: create SignInForm
//? Step 28: use [BlocConsumer] to setup form state
class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (left) {
              showSnackBar(
                context,
                left.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server Error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'invalid Email and Password Combination',
                ),
              );
            },
            //? Step 68: navigate to [NotesOverviewPage]
            (_) {
              r.ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.autoCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) => Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            const Icon(
              Icons.sticky_note_2_outlined,
              size: 150.0,
            ),
            const SizedBox(height: 8),
            TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInFormBloc>()
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (left) => left.maybeMap(
                        invalidEmail: (_) => 'Invalid Email',
                        orElse: () => null,
                      ),
                      (_) => null,
                    )),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                labelText: 'Password',
              ),
              obscureText: true,
              autocorrect: false,
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(value)),
              validator: (_) =>
                  context.read<SignInFormBloc>().state.password.value.fold(
                        (left) => left.maybeMap(
                          shortPassword: (_) => 'Short Password',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(const SignInFormEvent
                          .signInWithEmailAndPasswordPressed());
                    },
                    style:
                        TextButton.styleFrom(primary: Colors.blueGrey.shade500),
                    child: const Text('Sign In'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(
                            const SignInFormEvent
                                .registerWithEmailAndPasswordPressed(),
                          );
                    },
                    style:
                        TextButton.styleFrom(primary: Colors.blueGrey.shade500),
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<SignInFormBloc>()
                    .add(const SignInFormEvent.signInWithGooglePressed());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade700,
                onPrimary: Colors.white,
              ),
              child: const Text('Sign In with Google'),
            ),
            if (state.isSubmitting) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(),
            ]
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String message) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
