
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:open_litner/screens/home.dart';
import 'package:open_litner/screens/login.dart';
import 'package:open_litner/screens/splash.dart';
import 'package:open_litner/screens/words.dart';


class Routes {
  static List<GetPage> get page => [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/words', page: () => WordsScreen()),



      ];
}
