// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html_editor_enhanced/html_editor.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class MyTextEditor extends StatefulWidget {
  const MyTextEditor({
    Key? key,
    this.width,
    this.height,
    required this.text,
    required this.onSave,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final Future<dynamic> Function() onSave;

  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: FFButtonWidget(
            onPressed: () async {
              String data = await controller.getText();

              FFAppState().update(() {
                setState(() => FFAppState().textFromEditor = data);
              });

              widget.onSave();
            },
            text: "Save & Export",
            options: FFButtonOptions(
              width: 130,
              height: 40,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        HtmlEditor(
          controller: controller,
          htmlEditorOptions: HtmlEditorOptions(
            hint: "Enter Text Here",
            initialText: widget.text,
          ),
          htmlToolbarOptions:
              HtmlToolbarOptions(toolbarType: ToolbarType.nativeGrid),
          otherOptions: OtherOptions(height: 400),
        ),
      ],
    ));
  }
}
