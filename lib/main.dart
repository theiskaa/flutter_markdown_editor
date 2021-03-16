import 'package:flutter/material.dart';
import 'package:markdown_editor/view/editing.dart';
import 'package:markdown_editor/view/preview.dart';

import 'core/themes.dart';

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
      home: ScreensController(),
    );
  }
}

class ScreensController extends StatelessWidget {
  const ScreensController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Markdown Editor"),
          bottom: TabBar(
            overlayColor: null,
            indicatorWeight: 5,
            tabs: [Tab(text: "Edit"), Tab(text: "Preview")],
          ),
        ),
        body: TabBarView(
          children: [Editing(), Preview()],
        ),
      ),
    );
  }
}
