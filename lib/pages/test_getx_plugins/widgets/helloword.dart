import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hellowrod
class HellowordWidget extends GetView<TestGetxPluginsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(controller.state.title));
  }
}
