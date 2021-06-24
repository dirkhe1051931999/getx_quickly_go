import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/values/index.dart';
import 'package:getx_quick_go/common/widgets/index.dart';
import 'package:getx_quick_go/pages/home/index.dart';

import 'index.dart';

class AppIndexPage extends GetView<AppController> {
  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(() => Text(
              controller.tabTitles[controller.state.page],
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primary,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeView(),
        Text('CategoryPage'),
        Text('BookmarksPage'),
        Text('AccountPage'),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
