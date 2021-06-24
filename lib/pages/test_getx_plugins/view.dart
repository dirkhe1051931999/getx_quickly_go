import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class TestGetxPluginsPage extends GetView<TestGetxPluginsController> {
  // 内容页
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          HellowordWidget(),
          ElevatedButton(
            onPressed: () {
              controller.handleTap(1);
            },
            child: Text('snackbar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('getx page template create'),
      ),
      body: _buildView(),
    );
  }
}
