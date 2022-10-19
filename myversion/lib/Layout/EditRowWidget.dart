import 'package:flutter/material.dart';
import 'package:myversion/Data/MovieQuote.dart';

class EditRowWidget extends StatefulWidget {
  String labelText;
  String fieldText;

  EditRowWidget({super.key, required this.labelText, required this.fieldText});

  @override
  State<EditRowWidget> createState() => _EditRowWidgetState();
}

class _EditRowWidgetState extends State<EditRowWidget> {
  final fieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fieldController.text = widget.fieldText;
  }

  getFieldText() {
    print("Edit Field text: ${fieldController.text}");
    return fieldController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${widget.labelText}: ',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: fieldController
        )
      ],
    );
  }
}