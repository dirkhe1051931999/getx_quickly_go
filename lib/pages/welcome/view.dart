import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class WelcomePage extends GetView<WelcomeController> {
  // 内容页
  Widget _buildView() {
    return HellowordWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: _buildView(),
    );
  }
}
