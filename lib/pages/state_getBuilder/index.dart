import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/state_getBuilder/controller.dart';

// 和 GetX 比起来，多了手动控制更新，有两点需要注意。
// controller.update(); 触发更新
// id: "id2", 标记哪个 builder ，触发方式 controller.update(["id2"]); ，可传多个 Array 类型。
class StateGetBuilderView extends StatelessWidget {
  StateGetBuilderView({Key? key}) : super(key: key);
  final controller = CountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getBuilder'),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('getbuilder - 1');
                return Text('value->${_.count}');
              },
            ),
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('getbuilder - 2');
                return Text('value->${_.count}');
              },
            ),
            Divider(),
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 3");
                return Column(
                  children: [
                    Text('value -> ${_.count}'),
                    ElevatedButton(
                      onPressed: () {
                        _.add();
                      },
                      child: Text('GetBuilder -> add'),
                    )
                  ],
                );
              },
            ),
            Divider(),
            // count2
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 4");
                return Text('value count2 -> ${_.count2}');
              },
            ),
            Divider(),
            // id2
            GetBuilder<CountController>(
              id: "id2",
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 4");
                return Text('id2 -> value count2 -> ${_.count2}');
              },
            ),
            Divider(),
            // count ++
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),
            // count2 ++
            ElevatedButton(
              onPressed: () {
                controller.add2();
              },
              child: Text('add2'),
            ),
            // 更新没有id的
            ElevatedButton(
              onPressed: () {
                controller.update();
              },
              child: Text('controller.update()'),
            ),
            // 更新指定id的
            ElevatedButton(
              onPressed: () {
                controller.update(["id2"]);
              },
              child: Text('controller.update(id2)'),
            ),
          ],
        ),
      ),
    );
  }
}
