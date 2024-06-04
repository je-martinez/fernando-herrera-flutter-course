import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';

import 'presentation/screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).theme(),
      title: 'Material App',
      home: ChatScreen(),
    );
  }
}
