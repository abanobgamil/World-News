import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:world_news/layout/app_layout.dart';
import 'package:world_news/layout/cubit/cubit.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: Center(
            child: Text(
              "World News",
              style: GoogleFonts.libreBaskerville(
               textStyle: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                    color: AppCubit.get(context).isDark ? Colors.white : Colors.black  ,
               ),
              )
            ),
          ),
          nextScreen: const AppLayout(),
          pageTransitionType: PageTransitionType.rightToLeft,
          splashIconSize: 230,
          backgroundColor: AppCubit.get(context).isDark ? HexColor("#373636") : Colors.white,
          // animationDuration: const Duration(
        //   microseconds: 500000
        // ),
        ),
    );
  }
}


// Image(
//   height: 200,
//   width: 200,
//   image: AssetImage(
//
//   ),
// ),