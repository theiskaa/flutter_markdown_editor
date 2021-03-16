import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor/view/widgets/loading.dart';

class Preview extends StatelessWidget {
  final data;
  Preview({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data != null) ? Markdown(data: data) : loading(),
    );
  }
}
