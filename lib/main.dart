import 'package:flutter/material.dart';

import 'core/themes.dart';
import 'view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Markdown Editor | Flutter',
      theme: Themes.defaultTheme,
      home: MainScreen(),
    );
  }
}
