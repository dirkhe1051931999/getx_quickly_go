import 'package:get/get.dart';

class WelcomeState {
  // title
  final _title = "这个是欢迎页".obs;
  set title(value) => this._title.value = value;
  get title => this._title.value;
}
