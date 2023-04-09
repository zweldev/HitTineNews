import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';
import 'package:sunray_news/app/theme/cubit/theme_cubit.dart';

import 'app/modules/home/view/home_view.dart';
import 'app/modules/main/views/main_view.dart';
import 'app/theme/theme_constants.dart';
import 'app/theme/theme_manager.dart';
import 'package:splash_view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(SunRayNews());
}

class SunRayNews extends StatelessWidget {
  const SunRayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainViewCubit()),
        BlocProvider(create: (_) => ThemeCubit())
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              
              debugShowCheckedModeBanner: false,
              initialRoute: MainView.route,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeMode,
              routes: {
                MainView.route: (context) => MainView(),
              },
            );
          },
        );
      }),
    );
  }
}
