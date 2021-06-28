import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/vertical_scroll_text/plugins/vertical_margin_widget.dart';

import '../index.dart';

var hotSearchTag = [
  "网曝杨紫邓伦热恋 | 元宵节诗词 | 身份证异地能补办吗",
  "两限房是什么意思 | 公务员可以考研吗 | 一元等于多少日元",
  "喻恩泰喊话王景春 | 云南结婚吹唢呐视频 | 汉服下裙穿法"
];

/// hellowrod
class HellowordWidget extends GetView<VerticalScrollTextController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyNoticeVecAnimation(
          duration: const Duration(milliseconds: 3000), messages: hotSearchTag),
    );
  }
}
