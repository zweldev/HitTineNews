import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/modules/auth/cubit/auth_cubit.dart';
import 'package:sunray_news/app/modules/home/cubit/home_cubit.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';
import 'package:sunray_news/app/theme/cubit/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'app/modules/auth/view/auth_screen.dart';
import 'app/modules/main/views/main_view.dart';
import 'app/theme/theme_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'app/widgets/article_webview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator(host, port)

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(SunRayNews());
}

class SunRayNews extends StatelessWidget {
  SunRayNews({super.key});
  var user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainViewCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit())
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authS) {
                log('is user ${authS.user}');
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute:
                      authS.user == null ? AuthScreen.route : MainView.route,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: state.themeMode,
                  routes: {
                    AuthScreen.route: (context) => AuthScreen(),
                    MainView.route: (context) => MainView(),
                    ArticleWebView.route: (context) => ArticleWebView(),
                  },
                );
              },
            );
          },
        );
      }),
    );
  }
}
