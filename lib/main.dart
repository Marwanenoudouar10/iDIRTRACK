import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/LoginScreen/login.dart';
import 'package:idirtrack/Screens/presentation/splash_screen.dart';
import 'package:idirtrack/providers/sing_in_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SignInProvider())],
      child: const MyApp()));
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
          '/LoginScreen': (context) => const LoginScreen(),
        });
  }
}
