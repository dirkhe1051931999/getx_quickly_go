import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);
  _buildBackListTileRow(Map? val) {
    return val == null
        ? Container()
        : ListTile(
            title: Text("传值 id = " + val["id"].toString() + "     返回"),
            subtitle:
                Text('Get.back(result: {"传的参数": ${val["id"].toString()}}'),
            onTap: () {
              if (val['id'] != null) {
                Get.back(result: '${val["id"].toString()}');
              } else {
                Get.back();
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    final details = Get.arguments;
    final parameters = Get.parameters;

    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("导航-返回"),
            subtitle: Text('Get.back()'),
            onTap: () => Get.back(),
          ),
          details != null ? _buildBackListTileRow(details) : Container(),
          parameters.isNotEmpty
              ? _buildBackListTileRow(parameters)
              : Container(),
        ],
      ),
    );
  }
}
