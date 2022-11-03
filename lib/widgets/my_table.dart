import 'package:flutter/material.dart';
import 'package:montablegraph/utility/my_dialog.dart';
import 'package:montablegraph/utility/my_service.dart';
import 'package:montablegraph/widgets/widget_button.dart';
import 'package:montablegraph/widgets/widget_from.dart';
import 'package:montablegraph/widgets/widget_text.dart';

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  String? number;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(
            FocusScopeNode(),
          ),
          child: SizedBox(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            child: Stack(
              children: [
                WidgetText(text: "This is List Value"),
                Positioned(
                  bottom: 8,
                  child: Row(
                    children: [
                      valueForm(boxConstraints),
                      addButton(boxConstraints),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container addButton(BoxConstraints boxConstraints) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      width: boxConstraints.maxWidth * 0.25,
      height: 50,
      child: WidgetButton(
        label: 'Add',
        pressFunc: () {
          if (number?.isEmpty ?? true) {
            print('Have Space');
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', message: 'Please Enter Number');
          } else {
            print('No Space');
            processInsertValueToAPI();
          }
        },
      ),
    );
  }

  Container valueForm(BoxConstraints boxConstraints) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 10,
        bottom: 10,
        right: 10,
      ),
      width: boxConstraints.maxWidth * 0.75,
      child: WidgetFrom(
        textEditingController: textEditingController,
        hint: 'Number',
        textInputType: TextInputType.number,
        changeFunc: (String string) {
          number = string.trim();
        },
      ),
    );
  }

  Future<void> processInsertValueToAPI() async {
    await MyService().insertNumber(number: number!).then((value) {
      textEditingController.text = '';
    });
  }
}
