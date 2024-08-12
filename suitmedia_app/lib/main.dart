import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_app/page/first_screen.dart';
import 'package:suitmedia_app/providers/palindrome_provider.dart';
import 'package:suitmedia_app/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PalindromeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KM Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}