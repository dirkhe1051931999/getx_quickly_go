import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';
import 'package:getx_quick_go/pages/list_detail/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("导航-命名路由 home > list"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          ListTile(
            title: Text("导航-命名路由 home > list > detail"),
            subtitle: Text('Get.toNamed("/home/list/detail")'),
            onTap: () => Get.toNamed("/home/list/detail"),
          ),
          Divider(),
          ListTile(
            title: Text("导航-类对象"),
            subtitle: Text("Get.to(DetailView())"),
            onTap: () => Get.to(DetailView()),
          ),
          // 路由&导航
          ListTile(
            title: Text("导航-清除上一个"),
            subtitle: Text("Get.off(DetailView())"),
            onTap: () => Get.off(DetailView()),
          ),
          ListTile(
            title: Text("导航-清除所有，适用第一次进入app"),
            subtitle: Text("Get.offAll(DetailView())"),
            onTap: () => Get.offAll(DetailView()),
          ),
          Divider(),
          ListTile(
            title: Text("导航-arguments传值+返回值"),
            subtitle: Text(
                'Get.toNamed("/home/list/detail", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail",
                  arguments: {"id": 999});
              if (result != null) {
                Get.snackbar("返回值", "传入的参数 -> " + result);
              }
            },
          ),
          ListTile(
            title: Text("导航-parameters传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail?id=666")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail?id=666");
              if (result != null) {
                Get.snackbar("返回值", "传入的参数 -> " + result);
              }
            },
          ),
          ListTile(
            title: Text("导航-参数传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail/777")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail/777");
              if (result != null) {
                Get.snackbar("返回值", "传入的参数 -> " + result);
              }
            },
          ),
          Divider(),
          ListTile(
            title: Text("not found"),
            subtitle: Text('Get.toNamed("/home/list/777")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/777");
              if (result != null) {
                Get.snackbar("返回值", "传入的参数 -> " + result);
              }
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-中间件-认证Auth"),
            subtitle: Text('Get.toNamed(AppRoutes.My)'),
            onTap: () => Get.toNamed(AppRoutes.My),
          ),
          Divider(),
          ListTile(
            title: Text("obx"),
            subtitle: Text('Get.toNamed("/obs")'),
            onTap: () => Get.toNamed("/obs"),
          ),
          ListTile(
            title: Text("StateGetx"),
            subtitle: Text('Get.toNamed("/StateGetx")'),
            onTap: () => Get.toNamed("/StateGetx"),
          ),
          ListTile(
            title: Text("${AppRoutes.StateGetBuilder}"),
            subtitle: Text('Get.toNamed(${AppRoutes.StateGetBuilder})'),
            onTap: () => Get.toNamed("${AppRoutes.StateGetBuilder}"),
          ),
          ListTile(
            title: Text("${AppRoutes.StateValueBuilder}"),
            subtitle: Text('Get.toNamed(${AppRoutes.StateValueBuilder})'),
            onTap: () => Get.toNamed("${AppRoutes.StateValueBuilder}"),
          ),
          ListTile(
            title: Text("${AppRoutes.StateWorkers}"),
            subtitle: Text('Get.toNamed(${AppRoutes.StateWorkers})'),
            onTap: () => Get.toNamed("${AppRoutes.StateWorkers}"),
          ),
          Divider(),
          ListTile(
            title: Text("${AppRoutes.PutFind}"),
            subtitle: Text('Get.toNamed(${AppRoutes.PutFind})'),
            onTap: () => Get.toNamed("${AppRoutes.PutFind}"),
          ),
          ListTile(
            title: Text("${AppRoutes.LazyPut}"),
            subtitle: Text('Get.toNamed(${AppRoutes.LazyPut})'),
            onTap: () => Get.toNamed("${AppRoutes.LazyPut}"),
          ),
          Divider(),
          ListTile(
            title: Text("${AppRoutes.GetController_dio}"),
            subtitle: Text('Get.toNamed(${AppRoutes.GetController_dio})'),
            onTap: () => Get.toNamed("${AppRoutes.GetController_dio}"),
          ),
          Divider(),
          ListTile(
            title: Text("${AppRoutes.NestedNavigation}"),
            subtitle: Text('Get.toNamed(${AppRoutes.NestedNavigation})'),
            onTap: () => Get.toNamed("${AppRoutes.NestedNavigation}"),
          ),
          Divider(),
          ListTile(
            title: Text("${AppRoutes.Lang}"),
            subtitle: Text('Get.toNamed(${AppRoutes.Lang})'),
            onTap: () => Get.toNamed("${AppRoutes.Lang}"),
          ),
          ListTile(
            title: Text("${AppRoutes.Theme}"),
            subtitle: Text('Get.toNamed(${AppRoutes.Theme})'),
            onTap: () => Get.toNamed("${AppRoutes.Theme}"),
          ),
          ListTile(
            title: Text("${AppRoutes.TestGetXPlugins}"),
            subtitle: Text('Get.toNamed(${AppRoutes.TestGetXPlugins})'),
            onTap: () => Get.toNamed("${AppRoutes.TestGetXPlugins}"),
          ),
          Divider(),
          ListTile(
            title: Text(
                "${AppRoutes.Scroll_hide_appbar_with_horizontal_scrolling_navigation}"),
            subtitle: Text(
                'Get.toNamed(${AppRoutes.Scroll_hide_appbar_with_horizontal_scrolling_navigation})'),
            onTap: () => Get.toNamed(
                "${AppRoutes.Scroll_hide_appbar_with_horizontal_scrolling_navigation}"),
          ),
          Divider(),
          ListTile(
            title: Text("${AppRoutes.VerticalScrollText}"),
            subtitle: Text('Get.toNamed(${AppRoutes.VerticalScrollText})'),
            onTap: () => Get.toNamed("${AppRoutes.VerticalScrollText}"),
          ),
        ],
      ),
    );
  }
}
