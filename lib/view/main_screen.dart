import 'package:flutter/material.dart';

import 'preview.dart';
import 'widgets/markdown_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();
  String _markdownData = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: scaffold(),
    );
  }

  MarkdownField field() {
    return MarkdownField(
      controller: controller,
      onChanged: (val) => setState(() => _markdownData = val),
    );
  }

  Scaffold scaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: TabBarView(
        children: [field(), Preview(data: _markdownData)],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Markdown Editor"),
      bottom: TabBar(
        overlayColor: null,
        indicatorWeight: 5,
        tabs: [
          Tab(text: "Edit"),
          Tab(text: "Preview"),
        ],
      ),
    );
  }
}
