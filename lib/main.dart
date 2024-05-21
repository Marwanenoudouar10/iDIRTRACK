import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/LastPosition/last_position.dart';
import 'package:idirtrack/Screens/mainPage/principale_page.dart';
import 'package:idirtrack/Screens/presentation/splash_screen.dart';
import 'package:idirtrack/models/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Location location = Location('admin', 'admin');
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
        '/PrincipalePage': (context) => PrincipalePage(),
        '/LastPosition': (context) => LastPosition(
              location: location,
            ),

        // '/MapScreen': (context) => MapScreen(),
      },
    );
  }
}
