import 'package:flutter/material.dart';
import 'package:idirtrack/view/Screens/mainPage/mapTest.dart';
import 'package:idirtrack/view/Screens/mainPage/principale_page.dart';
import 'package:idirtrack/view/Screens/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iDIRTRACK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/PrincipalePage': (context) => const PrincipalePage(),
        // '/MapScreen': (context) => MapScreen(),
      },
    );
  }
}
