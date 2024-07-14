import 'package:ecowatt/pages/auth_pages/connection_page.dart';
import 'package:ecowatt/pages/auth_pages/login_page.dart';
import 'package:ecowatt/pages/auth_pages/register_page.dart';
import 'package:ecowatt/pages/home_page.dart';
import 'package:ecowatt/pages/setting_page.dart';
import 'package:ecowatt/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen (),
    );
  }
}

