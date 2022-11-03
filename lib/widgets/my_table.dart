import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montablegraph/controllers/app_controller.dart';
import 'package:montablegraph/utility/my_constant.dart';
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

  final appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    appController.readAllNumber();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints boxConstraints) {
        return GetX(
          init: AppController(),
          builder: (controller) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
            child: SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Stack(
                children: [
                  SizedBox(
                    height: boxConstraints.maxHeight-90,
                    child: ListView(
                      children: [
                        head(),
                        listNumber(controller),
                      ],
                    ),
                  ),
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
          ),
        );
      },
    );
  }

  ListView listNumber(AppController controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: controller.numberModels.length,
      itemBuilder: (context, index) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetText(text: controller.numberModels[index].id),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: WidgetText(text: controller.numberModels[index].number),
              ),
            ],
          ),
          const Divider(color: Colors.black45),
        ],
      ),
    );
  }

  Container head() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(color: Color.fromARGB(255, 200, 200, 200)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetText(
                  text: 'id',
                  textStyle: MyConstant().h2Style(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: WidgetText(
              text: 'number',
              textStyle: MyConstant().h2Style(),
            ),
          ),
        ],
      ),
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
        textInputType: TextInputType.text,
        changeFunc: (String string) {
          number = string.trim();
        },
      ),
    );
  }

  Future<void> processInsertValueToAPI() async {
    await MyService().insertNumber(number: number!).then((value) {
      textEditingController.text = '';
      appController.readAllNumber();
    });
  }
}
