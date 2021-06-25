import 'package:get/get.dart';
import 'package:getx_quick_go/common/middleware/router_auth.dart';
import 'package:getx_quick_go/common/middleware/router_welcome.dart';
import 'package:getx_quick_go/pages/app/index.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/bindings.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/index.dart';
import 'package:getx_quick_go/pages/dependency_put_find/index.dart';
import 'package:getx_quick_go/pages/getController_dio/bindings.dart';
import 'package:getx_quick_go/pages/getController_dio/view.dart';
import 'package:getx_quick_go/pages/home/index.dart';
import 'package:getx_quick_go/pages/lang/index.dart';
import 'package:getx_quick_go/pages/list/index.dart';
import 'package:getx_quick_go/pages/list_detail/index.dart';
import 'package:getx_quick_go/pages/login/index.dart';
import 'package:getx_quick_go/pages/my/index.dart';
import 'package:getx_quick_go/pages/nested_navigation/bindings.dart';
import 'package:getx_quick_go/pages/nested_navigation/index.dart';
import 'package:getx_quick_go/pages/notfound/index.dart';
import 'package:getx_quick_go/pages/scroll_hide_appbar_with_horizontal_scrolling_navigation/index.dart';
import 'package:getx_quick_go/pages/state_getBuilder/index.dart';
import 'package:getx_quick_go/pages/state_getx/index.dart';
import 'package:getx_quick_go/pages/state_obx/index.dart';
import 'package:getx_quick_go/pages/state_valueBuilder/index.dart';
import 'package:getx_quick_go/pages/state_workers/index.dart';
import 'package:getx_quick_go/pages/test_getx_plugins/bindings.dart';
import 'package:getx_quick_go/pages/test_getx_plugins/view.dart';
import 'package:getx_quick_go/pages/theme/index.dart';
import 'package:getx_quick_go/pages/welcome/bindings.dart';
import 'package:getx_quick_go/pages/welcome/view.dart';

part 'app_routes.dart';

class AppPages {
  static const App = AppRoutes.App;

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );
  static final routes = [
    // 白名单
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
    ),
    // 有权限中间件的my页面
    GetPage(
      name: AppRoutes.My,
      page: () => MyView(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
      transition: Transition.downToUp,
    ),
    // app
    GetPage(
      name: AppRoutes.App,
      page: () => AppIndexPage(),
      binding: AppBinding(),
    ),
    // welcome
    GetPage(
      name: AppRoutes.Welcome,
      page: () => WelcomePage(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
      binding: WelcomeBinding(),
    ),
    // 首页
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      children: [
        GetPage(
          name: AppRoutes.List,
          page: () => ListView2(),
          children: [
            GetPage(
              name: AppRoutes.Detail,
              page: () => DetailView(),
            ),
            GetPage(
              name: AppRoutes.Detail_ID,
              page: () => DetailView(),
              transition: Transition.upToDown,
            ),
          ],
        ),
      ],
    ),

    // obs
    GetPage(
      name: AppRoutes.Obs,
      page: () => StateObxView(),
    ),
    // StateGetx
    GetPage(
      name: AppRoutes.StateGetx,
      page: () => StateGetxView(),
    ),
    // StateGetBuilder
    GetPage(
      name: AppRoutes.StateGetBuilder,
      page: () => StateGetBuilderView(),
    ),
    // StateValueBuilder
    GetPage(
      name: AppRoutes.StateValueBuilder,
      page: () => StateValueBuilderView(),
    ),
    // StateWorkers
    GetPage(
      name: AppRoutes.StateWorkers,
      page: () => StateWorkersView(),
    ),
    // PutFind
    GetPage(
      name: AppRoutes.PutFind,
      page: () => PutFindView(),
    ),
    // LazyPut
    GetPage(
      name: AppRoutes.LazyPut,
      binding: DependencyLazyPutBinding(),
      page: () => LazyPutView(),
    ),
    // GetController_dio
    GetPage(
      name: AppRoutes.GetController_dio,
      binding: HotListDioBinding(),
      page: () => HotListDioView(),
    ),
    //NestedNavigation
    GetPage(
      name: AppRoutes.NestedNavigation,
      binding: NestedNavigationBindings(),
      page: () => NestedNavigationView(),
    ),
    // LangView
    GetPage(
      name: AppRoutes.Lang,
      page: () => LangView(),
    ),
    // Theme
    GetPage(
      name: AppRoutes.Theme,
      page: () => ThemeView(),
    ),
    // getx 猫哥插件生成的dir
    GetPage(
      name: AppRoutes.TestGetXPlugins,
      binding: TestGetxPluginsBinding(),
      page: () => TestGetxPluginsPage(),
    ),
    // scroll_hide_appbar_with_horizontal_scrolling_navigation
    GetPage(
      name: AppRoutes.Scroll_hide_appbar_with_horizontal_scrolling_navigation,
      binding: ScrollHideAppbarWithHorizontalScrollingNavigationBinding(),
      page: () => ScrollHideAppbarWithHorizontalScrollingNavigationPage(),
    ),
  ];
}
