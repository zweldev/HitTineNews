import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hit_tine_news/app/modules/home/view/home_view.dart';
import 'package:hit_tine_news/app/modules/main/views/main_view.dart';
import 'package:hit_tine_news/app/modules/splash/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(SunRayNews());
}

class SunRayNews extends StatelessWidget {
  const SunRayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.route,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(27, 69, 113, 1),
        fontFamily: 'Delicious'
        
      ),
      routes: {
        SplashView.route: (context) => SplashView(),
        HomeView.route: (context) => HomeView(),
        MainView.route :(context) => MainView(),
      },
    );
  }
}
