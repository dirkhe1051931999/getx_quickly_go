import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/utils/index.dart';
import 'package:getx_quick_go/common/values/index.dart';
import 'package:getx_quick_go/common/widgets/index.dart';

import 'index.dart';

class AppController extends GetxController {
  AppController();

  /// 响应式成员变量

  final state = AppState();

  /// 成员变量

  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  /// 事件

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  /// 生命周期

  ///在 widget 内存中分配后立即调用。
  ///你可以用它来为控制器初始化 initialize 一些东西。
  @override
  void onInit() {
    super.onInit();
    // 准备一些静态数据
    tabTitles = ['Home', 'Cagegory', 'Bookmarks', 'Account'];
    bottomTabs = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: Icon(
          IconFont.icon_Homehomepagemenu,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          IconFont.icon_Homehomepagemenu,
          color: AppColors.primary,
        ),
        label: 'main',
        backgroundColor: AppColors.white,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          IconFont.icon_categoryselected,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          IconFont.icon_categoryselected,
          color: AppColors.primary,
        ),
        label: 'category',
        backgroundColor: AppColors.white,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          IconFont.icon_book_mark_line,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          IconFont.icon_book_mark_line,
          color: AppColors.primary,
        ),
        label: 'tag',
        backgroundColor: AppColors.white,
      ),
      new BottomNavigationBarItem(
        icon: Icon(
          IconFont.icon_account,
          color: AppColors.tabBarElement,
        ),
        activeIcon: Icon(
          IconFont.icon_account,
          color: AppColors.primary,
        ),
        label: 'my',
        backgroundColor: AppColors.white,
      ),
    ];
    pageController = new PageController(initialPage: state.page);
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
    pageController.dispose();
    super.dispose();
    // dispose 释放对象
  }
}
