# getx_quick_go

flutter quickstart item with getx4 and dio4 , `sdk: ">=2.12.0 <3.0.0"`

[![RK7KL6.jpg](https://z3.ax1x.com/2021/06/24/RK7KL6.jpg)](getx_quick_go)

## 版本

```
Flutter: v2.2.2
Dart: v2.13.3
get: ^4.1.4
dio: ^4.0.0
```

## 基础功能

粗体字是 getx 的核心功能

- [x] 欢迎界面，控制是否第一次登陆后的下一个页面
- [x] **getx 路由，路由传参，清除路由**
- [x] 404 页面，getx 动画，snackbar,dialog,bottomSheet
- [x] **中间件，权限控制**
- [x] **响应式变量(obs)**
- [x] **stateGetx(有 controller 的 obs)**
- [x] **stateGetBuilder (手动控制更新的 obs)**
- [x] stateValueBuilder(一个 ValueBuilder 函数，包裹 Widget,适用于局部刷新)
- [x] **put/find(只要当前没有销毁，后面的页面都能找到当前页面的，并且保存状态)**
- [x] **lazyPut(只要当前没有销毁，后面的页面都能找到当前页面的，并且保存状态,后面的页面修改变量，也会提现在前面的页面)**
- [x] **getController 结合 dio,封装 http 请求**
- [x] 嵌套导航
- [x] 国际化，主题，quick create getx directory
- [x] footnavbar 功能,静态文件,icon,font
- [x] 项目结构与目录

## 进阶 demo

- [x] 上下滚动时隐藏 appbar，固定头部导航栏，导航栏不是 tab，而是 singlescrollview，可左右滚动，同时联动 pageview，左右滑动，或者点导航，都可以切换页面，可监听 pageview，pageview 的 page 可自定义，也可以下拉刷新，上拉加载，也可以单纯上下滚动

dir:`/lib/scroll_hide_appbar_with_horizontal_scrolling_navigation.dart`

[![R1fwx1.gif](https://z3.ax1x.com/2021/06/25/R1fwx1.gif)](https://imgtu.com/i/R1fwx1)
