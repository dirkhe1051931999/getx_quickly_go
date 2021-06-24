import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/getController_dio/controller.dart';

class HotListDioView extends GetView<HotListDioController> {
  const HotListDioView({Key? key}) : super(key: key);
  // 构建视图
  Widget _buildListView(dynamic items) {
    // 获取list
    List? data = !items.isEmpty ? items['result']['data'] : [];
    if (data is List && data.isEmpty) {
      // 是空List
      return Center(
        child: Column(
          children: [
            Text('没有数据'),
            ElevatedButton(
              onPressed: () {
                Get.find<HotListDioController>().getHotList();
              },
              child: Text('拉取数据'),
            )
          ],
        ),
      );
    } else if (data is List && !data.isEmpty) {
      // 不是空List
      return ListView.separated(
        itemBuilder: (context, index) {
          final dynamic item = data[index];
          return ListTile(
            onTap: () => null,
            title: Text(item['data']['title'].toString()),
            trailing: Text('${item['data']['topic_name'].toString()}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: data.length,
      );
    } else {
      // 为null
      return Center(
        child: Column(
          children: [
            Text('没有数据'),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('newsDio'),
      ),
      body: GetX<HotListDioController>(
        init: controller,
        builder: (_) => _buildListView(_.hotList.value),
      ),
    );
  }
}
