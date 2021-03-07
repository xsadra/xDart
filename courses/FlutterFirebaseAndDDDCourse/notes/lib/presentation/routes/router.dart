import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes/presentation/sign_in/sign_in_page.dart';
import 'package:notes/presentation/splash/splash_page.dart';

//? Step 35: add [auto_route, auto_route_generator] to pubspec and use it to manage routes
@MaterialAutoRouter(generateArgsHolderForSingleParameterRoutes: true)
class $Router {
  @initial
  SplashPage splashPage;
  SignInPage signInPage;
}
