import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montablegraph/controllers/app_controller.dart';
import 'package:montablegraph/models/number_model.dart';
import 'package:montablegraph/widgets/widget_text.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints boxConstraints) {
        return GetX(
          init: AppController(),
          builder: (controller) => Column(
            children: [
              WidgetText(
                  text:
                      "numberModels.lenght === ${controller.numberModels.length}"),
              Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                width: boxConstraints.maxWidth - 32,
                height: boxConstraints.maxWidth,
                child: Sparkline(
                  data: createData(numberModels: controller.numberModels),
                  lineColor: Colors.orange,
                  lineWidth: 2.0,
                  pointsMode: PointsMode.all,
                  pointSize: 4,
                  fillMode: FillMode.below,
                  fillColor: Color.fromARGB(255, 249, 200, 128),
                  enableGridLines: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<double> createData({required List<NumberModel> numberModels}) {
    var result = <double>[];

    for (var element in numberModels) {
      String numberStr = element.number;
      double numberDou = double.parse(numberStr);
      result.add(numberDou);
    }
    return result;
  }
}
