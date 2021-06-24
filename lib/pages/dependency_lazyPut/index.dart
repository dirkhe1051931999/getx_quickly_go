import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/controller.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/next_getview_page.dart';

class LazyPutView extends StatelessWidget {
  const LazyPutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dependency_lazyPut'),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<CountController>(
              init: Get.find<CountController>(),
              initState: (_) {},
              builder: (_) {
                return Text('value -> ${_.count}');
              },
            ),
            Divider(),

            // 按钮
            ElevatedButton(
              onPressed: () {
                Get.find<CountController>().add();
              },
              child: Text('add'),
            ),

            // 跳转
            ElevatedButton(
              onPressed: () {
                Get.to(NextPageView());
              },
              child: Text('Next GetView Page'),
            ),
          ],
        ),
      ),
    );
  }
}
