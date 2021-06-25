import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class ScrollHideAppbarWithHorizontalScrollingNavigationPage extends GetView<
    ScrollHideAppbarWithHorizontalScrollingNavigationController> {
  @override
  Widget build(BuildContext context) {
    // 头部navigation，可左右滑动，单导航可上下滑动
    return Scaffold(body: TitleScrollNavigationWidget());
  }
}
