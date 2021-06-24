import 'package:get/get.dart';

// 定义响应式成员变量
class TestGetxPluginsState {
  // title
  final _title = "初始值".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;
}
