// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sunray_news/app/core/extensions/navigation_extensions.dart';

// import '../../main/views/main_view.dart';

// class SplashView extends StatefulWidget {
//   SplashView({super.key});

//   static String route = "/splash_view";

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     Timer(
//       const Duration(
//         seconds: 5,
//       ),
//       () => context.pushReplacementNamed(MainView.route),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //primary color
//       color: Theme.of(context).primaryColor,
//       child: Center(
//         child: Container(
//           width: 300,
//           height: 200,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 'assets/images/sunray-news-logo.png',
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
