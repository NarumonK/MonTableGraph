import 'package:flutter/material.dart';
import 'package:montablegraph/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const WidgetButton({
    super.key,
    required this.label,
    required this.pressFunc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressFunc,
      child: WidgetText(text: label),
    );
  }
}
