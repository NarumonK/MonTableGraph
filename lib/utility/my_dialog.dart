// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montablegraph/widgets/widget_text.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void normalDialog({required String title, required String message}) {
    Get.dialog(
      AlertDialog(
        title: WidgetText(text: title),
        
        content: WidgetText(text: message),
      ),
    );
  }
}
