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
/*
# Hi there I'm Ismael 👋

Mobile app developer at [**Lomsa**](https://lomsa.com)
Focused on Dart-Flutter. 
Contact me with: ***🇬🇧English,*** ***🇬🇪Georgian,*** ***🇦🇿Azerbaijani*** and ***🇹🇷Turkish.*** 
*/