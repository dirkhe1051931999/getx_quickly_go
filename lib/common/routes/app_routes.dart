part of 'app_pages.dart';

abstract class AppRoutes {
  static const Initial = "/";
  static const Welcome = "/welcome";
  static const App = "/app";
  // 路由、权限
  static const Home = '/home';
  static const List = '/list';
  static const Detail = '/detail';
  static const Detail_ID = '/detail/:id';
  static const NotFound = '/notfound';
  static const Login = '/login';
  static const My = '/my';
  // 状态管理
  static const Obs = '/obs';
  static const StateGetx = '/StateGetx';
  static const StateGetBuilder = '/StateGetBuilder';
  static const StateValueBuilder = '/StateValueBuilder';
  static const StateWorkers = '/StateWorkers';
  static const PutFind = '/PutFind';
  static const LazyPut = '/LazyPut';
  // http请求
  static const GetController_dio = '/GetController_dio';
  // 嵌套导航
  static const NestedNavigation = '/NestedNavigation';
  // lang
  static const Lang = '/Lang';
  // theme
  static const Theme = '/Theme';
  // getx vscode插件生成的template
  static const TestGetXPlugins = '/TestGetXPlugins';
  // scroll_hide_appbar_with_horizontal_scrolling_navigation
  static const Scroll_hide_appbar_with_horizontal_scrolling_navigation =
      '/scroll_hide_appbar_with_horizontal_scrolling_navigation';
  // 垂直滚动的跑马灯
  static const VerticalScrollText = '/VerticalScrollText';
}
