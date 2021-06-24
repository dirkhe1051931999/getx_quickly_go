import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 数值后写.obs操作，是说明定义了该变量为响应式变量，当该变量数值变化时，页面的刷新方法将自动刷新；基础类型，List，类都可以加.obs，使其变成响应式变量
// 局部刷新
// 适合界面上 简单状态管理，写起来很快。
class StateObxView extends StatelessWidget {
  StateObxView({Key? key}) : super(key: key);
  final count = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obx...'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Obx(() => Text('count1->' + count.toString())),
            Obx(() => Text('count->' + count.toString())),
            Divider(),
            ElevatedButton(
              onPressed: () {
                count.value++;
              },
              child: Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
