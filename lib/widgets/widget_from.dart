// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetFrom extends StatelessWidget {
  final String hint;
  final TextInputType? textInputType;
  final Function(String) changeFunc;
  final TextEditingController? textEditingController;

  const WidgetFrom({
    Key? key,
    required this.hint,
    this.textInputType,
    required this.changeFunc,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: changeFunc,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        border: OutlineInputBorder(),
      ),
    );
  }
}
