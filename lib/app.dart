import 'package:flutter/material.dart';
import 'package:to_do_app/Home_page.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: HomePage(),
    );
  }
}
