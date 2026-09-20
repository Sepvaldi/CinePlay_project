import 'package:flutter/material.dart';
import 'Login_page.dart';
import 'Main_navigation_page.dart';

void main () {
  runApp(const CinePlayApp());
}

class CinePlayApp extends StatelessWidget {
  const CinePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinePlay App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/login':(context) => const LoginPage(),
        '/mainnav':(context) => const MainNavigationPage(),
      },
    );
  }
}