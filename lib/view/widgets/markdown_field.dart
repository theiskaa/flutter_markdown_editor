import 'package:flutter/material.dart';

class MarkdownField extends StatelessWidget {
  final int maxLines;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final bool autofocus;

  const MarkdownField({
    Key key,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          TextField(
            cursorColor: Colors.cyan[700],
            controller: controller,
            autofocus: (autofocus != null) ? autofocus : true,
            textInputAction: (textInputAction != null)
                ? textInputAction
                : TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: (maxLines != null) ? maxLines : 99999,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void wrapWith(String left, String right) {
    final text = controller.value.text;
    final selection = controller.selection;
    final middle = selection.textInside(text);
    final newText = selection.textBefore(text) +
        '$left$middle$right' +
        selection.textAfter(text);

    controller.value = controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        offset: selection.baseOffset + left.length + middle.length,
      ),
    );
  }
}
