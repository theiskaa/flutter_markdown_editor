import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor/view/widgets/loading.dart';

class Preview extends StatelessWidget {
  final String data;
  Preview({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data != null)
          ? Padding(
              padding: const EdgeInsets.all(15),
              child: Markdown(data: data),
            )
          : loading(),
    );
  }
}
