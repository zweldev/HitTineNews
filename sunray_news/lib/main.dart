import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunray_news/app/core/enum/user_status.dart';
import 'package:sunray_news/app/modules/auth/cubit/auth_cubit.dart';
import 'package:sunray_news/app/modules/auth/view/auth_options_view.dart';
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

List userStatus = [UserStatus.signedIn, UserStatus.signedOut];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? userData = prefs.getString('userdata');

  log('located userdata ${userData}');

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      print('user is signed Out!');
    } else {
      print('User is signed in!');
    }
  });
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(SunRayNews(
    status: userData == null ? UserStatus.signedOut : UserStatus.signedIn,
  ));
}

class SunRayNews extends StatelessWidget {
  SunRayNews({super.key, required this.status});
  UserStatus status;

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
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: getScreen(status),
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: state.themeMode,
                  routes: {
                    AuthOptionView.route: (context) => AuthOptionView(),
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
