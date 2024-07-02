
import 'package:html_editor_enhanced/html_editor.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class MyTextEditor extends StatefulWidget {
  const MyTextEditor({
    Key? key,
    this.width,
    this.height,
    required this.text,
    required this.language,
    required this.onSave,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String text;
  final String language;
  final Future<dynamic> Function(String text) onSave;

  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  HtmlEditorController controller = HtmlEditorController();

  String getSaveButtonText() {
    switch (widget.language) {
      case 'en':
        return 'Save';
      case 'de':
        return 'Speichern';
      case 'tr':
        return 'Kaydet';
      case 'fr':
        return 'Enregistrer';
      default:
        return 'Save';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: FFButtonWidget(
                onPressed: () async {
                  String text = await controller.getText();
                  widget.onSave(text);
                },
                text: getSaveButtonText(),
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
              otherOptions: OtherOptions(height: widget.height!),
            ),
          ],
        ));
  }
}
