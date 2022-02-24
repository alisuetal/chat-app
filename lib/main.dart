import 'package:chat/screens/auth_screen.dart';
import 'package:chat/screens/home_screen.dart';
import 'package:chat/screens/tab_screen.dart';
import 'package:chat/utils/app_routes.dart';
import 'package:chat/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      systemNavigationBarColor: Color(0xFFFFFFFF), //Color(0xFFEBEBEB),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatAPP',
      theme: ThemeData(
        primarySwatch: palette,
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 40,
            color: palette,
          ),
          headline2: TextStyle(
            fontSize: 30,
            color: palette.withOpacity(0.44),
          ),
          headline3: const TextStyle(
            fontSize: 24,
            color: palette,
            fontWeight: FontWeight.w600,
          ),
          headline4: const TextStyle(
            fontSize: 20,
            color: palette,
            fontWeight: FontWeight.w600,
          ),
          headline5: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.LOGIN,
      routes: {
        AppRoutes.APP: (context) => const TabScreen(),
      },
    );
  }
}
