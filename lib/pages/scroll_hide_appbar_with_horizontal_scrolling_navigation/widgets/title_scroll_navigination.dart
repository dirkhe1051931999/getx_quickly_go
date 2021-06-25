import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/values/colors.dart';
import 'package:getx_quick_go/pages/scroll_hide_appbar_with_horizontal_scrolling_navigation/plugin/navigation_helpers.dart';
import 'package:getx_quick_go/pages/scroll_hide_appbar_with_horizontal_scrolling_navigation/plugin/title_scroll_navigation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';

List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

/// hellowrod
class TitleScrollNavigationWidget extends GetView<
    ScrollHideAppbarWithHorizontalScrollingNavigationController> {
  @override
  Widget build(BuildContext context) {
    return TitleScrollNavigation(
      showMoreCategories: true,
      sliverAppBarLeading: Text(
        'logo',
        style: TextStyle(
          color: AppColors.contentFontBlack,
        ),
      ),
      sliverAppBarTitle: Text(
        'placeholder',
        style: TextStyle(
          color: AppColors.contentFontBlack,
        ),
      ),
      sliverAppBarAction: [
        Text(
          'link',
          style: TextStyle(
            color: AppColors.contentFontBlack,
          ),
        )
      ],
      sliverAppBarBackgroundColor: AppColors.white,
      toolbarHeight: 40.h,
      barStyle: TitleNavigationBarStyle(
        activeColor: AppColors.primary,
      ),
      identiferStyle:
          NavigationIdentiferStyle(color: AppColors.primary, height: 3.h),
      getMoreCategores: () {
        print('getMoreCategores');
      },
      onPageChanged: (index) {
        print(index);
      },
      titles: [
        "Main Page",
        "Personal Information",
        "Personalization",
        "Security",
        "Payment Methods",
      ],
      pages: [
        SingleChildScrollView(
          child: Column(children: [
            FlutterLogo(
              size: 300,
            ),
            FlutterLogo(
              size: 300,
            ),
            FlutterLogo(
              size: 300,
            )
          ]),
        ),
        Container(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(
              releaseText: '释放刷新',
              idleText: '下拉刷新',
              refreshingText: '获取中...',
              completeText: '已推荐xx条数据',
              failedText: '刷新失败:(',
              refreshingIcon: Icon(
                Icons.refresh,
                color: AppColors.primary,
              ),
              completeIcon: Icon(Icons.yard),
            ),
            footer: ClassicFooter(
              loadingText: '加载中...',
              noDataText: '暂无数据',
              idleText: '上拉刷新',
              failedText: '加载失败:(',
              canLoadingText: '释放加载',
            ),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: ListView.builder(
              itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
              itemExtent: 100.0,
              itemCount: items.length,
            ),
          ),
        ),
        Container(color: Colors.green[50]),
        Container(color: Colors.purple[50]),
        Container(color: Colors.yellow[50]),
      ],
    );
  }
}
