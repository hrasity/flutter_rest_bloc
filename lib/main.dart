import 'package:flutter/material.dart';
import 'package:rest_bloc/page/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserScreen(),
    );
  }
}
