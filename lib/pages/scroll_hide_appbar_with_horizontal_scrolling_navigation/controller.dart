import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class ScrollHideAppbarWithHorizontalScrollingNavigationController
    extends GetxController {
  ScrollHideAppbarWithHorizontalScrollingNavigationController();

  /// 响应式成员变量

  final state = ScrollHideAppbarWithHorizontalScrollingNavigationState();

  /// 成员变量
  late ScrollController controller = ScrollController();
  late RefreshController refreshController =
      RefreshController(initialRefresh: false);

  /// 事件
  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    refreshController.loadComplete();
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // new 对象
    // 初始静态数据
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或
  ///async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
  }

  ///dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    refreshController.dispose();
    // dispose 释放对象
  }
}
