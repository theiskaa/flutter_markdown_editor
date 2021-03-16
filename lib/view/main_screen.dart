import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';

import 'preview.dart';
import 'widgets/markdown_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  String _markdownData = "";

  void wrapWith({@required String leftSide, String rightSide}) {
    final text = _controller.value.text;
    final selection = _controller.selection;
    final middle = selection.textInside(text);
    final newText = selection.textBefore(text) +
        '$leftSide$middle$rightSide' +
        selection.textAfter(text);

    _controller.value = _controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.baseOffset + leftSide.length + middle.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: scaffold(),
    );
  }

  Widget field() {
    return ListView(
      children: [
        MarkdownField(
          controller: _controller,
          onChanged: (val) => setState(() => _markdownData = _controller.text),
        ),
      ],
    );
  }

  Scaffold scaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: markdownEditer(),
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

  Widget markdownEditer() {
    return Transform.translate(
      offset: Offset(0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Colors.grey[100],
        child: SizedBox(
          height: 64,
          child: Center(
            child: Scrollbar(
              controller: _scrollController,
              isAlwaysShown: true,
              child: markdownEdititems(),
            ),
          ),
        ),
      ),
    );
  }

  ListView markdownEdititems() => ListView(
        shrinkWrap: true,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.format_size_rounded),
            onTap: () => wrapWith(leftSide: '# ', rightSide: ''),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.format_bold),
            onTap: () => wrapWith(
              leftSide: '**',
              rightSide: '**',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.list),
            onTap: () => wrapWith(
              leftSide: '- ',
              rightSide: '',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.format_italic),
            onTap: () => wrapWith(
              leftSide: '*',
              rightSide: '*',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.code),
            onTap: () => wrapWith(
              leftSide: '```',
              rightSide: '```',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.strikethrough_s_rounded),
            onTap: () => wrapWith(
              leftSide: '~~',
              rightSide: '~~',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.link_sharp),
            onTap: () => wrapWith(
              leftSide: '[',
              rightSide: ']()',
            ),
          ),
          SizedBox(width: 20),
          OpacityButton(
            opacityValue: .2,
            child: Icon(Icons.image),
            onTap: () => wrapWith(
              leftSide: '![](https://',
              rightSide: ')',
            ),
          ),
        ],
      );
}
