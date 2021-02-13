import 'package:sailor/sailor.dart';

import 'pages/initial_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';

// 1- add Routes to sailor
class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: RoutePaths.initialPage,
        builder: (context, args, paramMap) {
          return InitialPage();
        },
      ),
      // !not recommended to use paramMap
      SailorRoute(
        name: RoutePaths.secondPage,
        builder: (context, args, paramMap) {
          return SecondPage(
            name: paramMap.param<String>('name'),
            age: paramMap.param<int>('age'),
          );
        },
        // setup param properties
        params: [
          SailorParam(name: 'name', isRequired: true),
          SailorParam(name: 'age', defaultValue: 17),
        ],
      ),
      // *recommended to use args
      SailorRoute(
        name: RoutePaths.ThirdPage,
        builder: (context, args, _) => ThirdPage(args: args),
      ),
    ]);
  }
}

// 1.1- use Statics instead of String
class RoutePaths {
  static const String initialPage = '/initial';
  static const String secondPage = '/second';
  static const String ThirdPage = '/third';

  RoutePaths._();
}
