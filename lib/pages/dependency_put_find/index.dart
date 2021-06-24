import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/dependency_put_find/controller.dart';
import 'package:getx_quick_go/pages/dependency_put_find/next_page.dart';

// 只要当前没有销毁，后面的页面都能找到当前页面的，并且保存状态
class PutFindView extends StatelessWidget {
  PutFindView({Key? key}) : super(key: key);
  final controller = Get.put<CountController>(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dependency_put_find'),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('value -> ${_.count}');
              },
            ),
            Divider(),
            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),

            // 跳转
            ElevatedButton(
              onPressed: () {
                Get.to(NextPageView());
              },
              child: Text('next page'),
            ),
          ],
        ),
      ),
    );
  }
}
