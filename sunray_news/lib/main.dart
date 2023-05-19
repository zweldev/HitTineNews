
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunray_news/app/modules/home/cubit/home_cubit.dart';
import 'package:sunray_news/app/modules/main/cubit/main_view_cubit.dart';
import 'package:sunray_news/app/theme/cubit/theme_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:sunray_news/app/widgets/article_card.dart';
import 'app/modules/main/views/main_view.dart';
import 'app/theme/theme_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'app/widgets/article_webview.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top, buiSystemUiOverlay.bottom]);

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(SunRayNews());
}

class SunRayNews extends StatelessWidget {
  SunRayNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainViewCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => HomeCubit())
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
                ArticleWebView.route:(context) => ArticleWebView(),
              },
            );
          },
        );
      }),
    );
  }
}

