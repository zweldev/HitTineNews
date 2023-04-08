import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';

import 'app/modules/home/view/home_view.dart';
import 'app/modules/main/views/main_view.dart';
import 'app/modules/splash/view/splash_view.dart';
import 'app/theme/theme_constants.dart';
import 'app/theme/theme_manager.dart';
import 'package:splash_view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(SunRayNews());
}

ThemeManager _themeManager = ThemeManager();

class SunRayNews extends StatelessWidget {
  const SunRayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => MainViewCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MainView.route,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        routes: {
          MainView.route: (context) => MainView(),
        },
      ),
    );
  }
}
