import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hit_tine_news/app/modules/home/view/home_view.dart';
import 'package:hit_tine_news/app/modules/splash/view/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(HitTineNews());
}

class HitTineNews extends StatelessWidget {
  const HitTineNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.route,
      routes: {
        SplashView.route: (context) => SplashView(),
        HomeView.route: (context) => HomeView(),
      },
    );
  }
}
