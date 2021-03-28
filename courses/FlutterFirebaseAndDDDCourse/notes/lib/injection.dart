import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

//? Step 21: add [get_it, injectable, injectable_generator] to pubspec
//? Step 22: create a file for Dependencies injection
//? Step 23: mark [SignInFormBloc, FirebaseAuthFacade] as a injectable class
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies({@required String env}) =>
    $initGetIt(getIt, environment: env);
