import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/lang/translation_service.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';
import 'package:getx_quick_go/common/services/global_config.dart';
import 'package:getx_quick_go/common/utils/index.dart';
import 'package:getx_quick_go/global.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => GlobalConfigService().init());
  await Global.init();
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // 日志
        enableLog: true,
        logWriterCallback: Logger.write,
        // 路由
        getPages: AppPages.routes,
        unknownRoute: AppPages.unknownRoute,
        // 启动页面
        // initialRoute: AppPages.App,
        initialRoute: AppRoutes.Welcome,
        // initialBinding: SplashBinding(),
        // home: SplashPage(),

        // 多语言
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
      ),
    );
  }
}
