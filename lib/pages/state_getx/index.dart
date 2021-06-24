import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/state_getx/controller.dart';

// 相对于obx来说，传的参数更多
// 局部刷新
// 业务层和数据层分开
// 适合控制多控制器、多状态更新，可精细控制初始、局部渲染。

class StateGetxView extends StatelessWidget {
  StateGetxView({Key? key}) : super(key: key);
  final controller = CountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('state_getx'),
      ),
      body: Center(
        child: Column(
          children: [
            // count1
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('GetX -1');
                return Text('value 1 -> ${_.count}');
              },
            ),
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('GetX -2');
                return Text('value 2 -> ${_.count}');
              },
            ),
            Divider(),
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 3");
                return Column(
                  children: [
                    Text('value 3 -> ${_.count}'),
                    ElevatedButton(
                      onPressed: () {
                        _.add();
                      },
                      child: Text('count1'),
                    )
                  ],
                );
              },
            ),
            // count2
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 4");
                return Text('value 4 -> ${_.count2}');
              },
            ),
            Divider(),
            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('count1'),
            ),

            ElevatedButton(
              onPressed: () {
                controller.add2();
              },
              child: Text('count2'),
            ),
          ],
        ),
      ),
    );
  }
}
