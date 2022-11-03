import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montablegraph/controllers/app_controller.dart';
import 'package:montablegraph/widgets/graph.dart';
import 'package:montablegraph/widgets/my_table.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'Table',
    'Graph',
  ];

  var iconDatas = <IconData>[
    Icons.table_chart,
    Icons.graphic_eq,
  ];

  var bodys = <Widget>[const MyTable(), const Graph(),];

  var bottomNavigationBarItems = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < titles.length; i++) {
      bottomNavigationBarItems.add(
        BottomNavigationBarItem(
          icon: Icon(
            iconDatas[i],
          ),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AppController(),
      builder: (AppController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[controller.indexBodys.value]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavigationBarItems,
            currentIndex: controller.indexBodys.value,
            onTap: (value) {
              controller.indexBodys.value = value;
            },
          ),
          body: bodys[controller.indexBodys.value],
        );
      },
    );
  }
}
