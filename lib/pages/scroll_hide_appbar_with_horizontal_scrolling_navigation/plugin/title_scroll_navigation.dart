// https://github.com/seel-channel/scroll_navigation/blob/master/README.md
import 'package:getx_quick_go/pages/scroll_hide_appbar_with_horizontal_scrolling_navigation/plugin/navigation_helpers.dart';
import 'package:helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _TitleProps {
  _TitleProps(this.key, this.width);
  GlobalKey key;
  double width;
}

class _IdentifierProps {
  _IdentifierProps(this.position, this.width);
  double width, position;
}

class TitleScrollNavigation extends StatefulWidget {
  ///It is a navigation that will only show texts [titles].
  ///You can move with gestures or pressing any title.
  ///
  ///Also, the identifier will be adjusted to the text width
  ///and will have a color interpolation between titles.
  TitleScrollNavigation({
    Key? key,
    required this.titles,
    required this.pages,
    required this.sliverAppBarLeading,
    required this.sliverAppBarTitle,
    required this.sliverAppBarAction,
    required this.sliverAppBarBackgroundColor,
    required this.getMoreCategores,
    required this.toolbarHeight,
    required this.onPageChanged,
    this.initialPage = 0,
    this.showIdentifier = true,
    required this.showMoreCategories,
    NavigationBodyStyle? bodyStyle,
    TitleNavigationBarStyle? barStyle,
    NavigationIdentiferStyle? identiferStyle,
  })  : assert(titles.length == pages.length),
        this.barStyle = barStyle ?? TitleNavigationBarStyle(),
        this.bodyStyle = bodyStyle ?? NavigationBodyStyle(),
        this.identiferStyle = identiferStyle ?? NavigationIdentiferStyle(),
        super(key: key);
  final Function onPageChanged;
  // toolbar的高度
  final double toolbarHeight;
  // 去更多分类
  final Function getMoreCategores;

  /// 是否显示更多categories
  final bool showMoreCategories;

  /// sliverAppBar 的 background
  final Color sliverAppBarBackgroundColor;

  /// sliverAppBar 的 leading
  final Widget sliverAppBarLeading;

  /// sliverAppBar 的 title
  final Widget sliverAppBarTitle;

  /// sliverAppBar 的 title
  final List<Widget> sliverAppBarAction;

  /// Are the titles than show it
  final List<String> titles;

  /// Are the pages that the PageView will have
  final List<Widget> pages;

  /// It is the initial page that will show. The value must match
  /// with the existing indexes and the total number of Nav Items
  final int initialPage;

  ///It will show the identifier.
  final bool showIdentifier;

  ///Title Navigation bar style
  final TitleNavigationBarStyle barStyle;

  ///PageView and Scaffold style
  final NavigationBodyStyle bodyStyle;

  ///Identifier style
  final NavigationIdentiferStyle identiferStyle;

  @override
  _TitleScrollNavigationState createState() => _TitleScrollNavigationState();
}

class _TitleScrollNavigationState extends State<TitleScrollNavigation> {
  final ScrollController _titlesController = ScrollController();
  late PageController _controller;

  int _currentPage = 0;
  bool _itemTapped = false;
  double _halfWidth = 0.0;
  double _maxScroll = 0.0;
  double _paddingLeft = 0.0;
  double _initialPosition = 0.0;

  List<Widget> _navTitles = [];
  _IdentifierProps _identifier = _IdentifierProps(0.0, 0.0);
  List<_TitleProps> _titlesProps = [];

  ///Go to a page :)
  void goToPage(int index) => _titleTapped(index);

  @override
  void initState() {
    _currentPage = widget.initialPage;
    _paddingLeft = widget.barStyle.padding.left;
    _controller = PageController(initialPage: widget.initialPage);
    _controller.addListener(_scrollListener);

    for (int i = 0; i < widget.titles.length; i++) {
      _titlesProps.add(_TitleProps(GlobalKey(), 0.0));
      _navTitles.add(_createTextLerp(i, 0.0));
    }

    _setTitleLerp(_currentPage, 1.0);
    Misc.onLayoutRendered(_setTitlesWidth);
    super.initState();
  }

  @override
  void dispose() {
    _titlesController.dispose();
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double page = _controller.page!;
    final int current = page.floor();
    final double decimal = page - current;

    if (_itemTapped) _clearTitleLerp();
    if (current + 1 < widget.pages.length) {
      _identifier.width = _getIdentifierWidth(current, decimal);
      _identifier.position = _getIdentifierPosition(current, decimal);
      _setTitleLerp(current + 1, decimal);
      _setTitleLerp(current, 1 - decimal);
    }

    double jumpTo = _identifier.position - _halfWidth + (_identifier.width / 2);

    if (jumpTo > _maxScroll)
      jumpTo = _maxScroll;
    else if (jumpTo < 0) jumpTo = 0;

    _titlesController.jumpTo(jumpTo);

    if (current != _currentPage) _currentPage = current;
  }

  //---------//
  //CALLBACKS//
  //---------//
  void _setTitlesWidth() {
    setState(() {
      double position = 0;
      for (int i = 0; i < _titlesProps.length; i++)
        _titlesProps[i].width = _titlesProps[i].key.width ?? 0;
      for (var i = 0; i < widget.initialPage; i++) {
        position += _getTitleWidth(i);
      }
      _identifier.width = _getTitleWidth(widget.initialPage);
      _identifier.position = widget.barStyle.spaceBetween +
          position +
          _paddingLeft * widget.initialPage;

      _halfWidth = context.media.width / 2;
      _maxScroll = _titlesController.position.maxScrollExtent;
    });
  }

  void _titleTapped(int index) async {
    setState(() => _itemTapped = true);
    await _controller.animateToPage(
      index,
      curve: Curves.ease,
      duration: Duration(milliseconds: 400),
    );
    setState(() {
      _itemTapped = false;
      _clearTitleLerp();
      _setTitleLerp(_controller.page!.round(), 1.0);
    });
  }

  //----------//
  //IDENTIFIER//
  //----------//
  double _getTitleWidth(int index) => _titlesProps[index].width;

  double _getIdentifierWidth(int page, double decimal) {
    double? floorWidth({int next = 0}) => _getTitleWidth(page + next);
    final double width = floorWidth()!;
    final double nextWidth = floorWidth(next: 1)!;
    return width + ((nextWidth - width) * decimal);
  }

  double _getIdentifierPosition(int page, double decimal) {
    double widthPadding(i) => _getTitleWidth(i) + widget.barStyle.spaceBetween;
    double position = 0;

    if (page != _currentPage) {
      for (var i = 0; i < page; i++) position += widthPadding(i);
      _initialPosition = position;
    } else {
      position = _initialPosition;
    }

    return position + _paddingLeft + (widthPadding(page) * decimal);
  }

  //----------//
  //COLOR LERP//
  //----------//
  void _clearTitleLerp() {
    for (int i = 0; i < _titlesProps.length; i++) _setTitleLerp(i, 0.0);
  }

  void _setTitleLerp(int index, double lerp) {
    _navTitles[index] = _createTextLerp(index, lerp);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: widget.sliverAppBarBackgroundColor,
              // title
              title: widget.sliverAppBarTitle,
              // logo
              leading: widget.sliverAppBarLeading,
              // right klink
              actions: widget.sliverAppBarAction,
              floating: true,
              toolbarHeight: widget.toolbarHeight,
              snap: true,
              // 固定 categories
              pinned: true,
              // categories
              bottom: PreferredSize(
                preferredSize: Size(0, kToolbarHeight),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.barStyle.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: -3,
                        blurRadius: 2,
                        offset: Offset(0, widget.barStyle.elevation),
                      ),
                    ],
                  ),
                  child: _buildScrollTitles(),
                ),
              ),
            ),
          ];
        },
        // 左右滚动的page
        body: Container(
          child: PageView(
            onPageChanged: (index) {
              widget.onPageChanged(index);
            },
            physics: widget.bodyStyle.physics,
            children: widget.pages,
            controller: _controller,
            scrollDirection: widget.bodyStyle.scrollDirection,
            dragStartBehavior: widget.bodyStyle.dragStartBehavior,
          ),
        ),
      ),
    );
  }

  Widget _buildScrollTitles() {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(right: 10),
          controller: _titlesController,
          scrollDirection: Axis.horizontal,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Stack(
              children: [
                Container(
                  padding: widget.barStyle.padding,
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    for (int i = 0; i < _titlesProps.length; i++) ...[
                      GestureDetector(
                        onTap: () => _titleTapped(i),
                        child: _navTitles[i],
                      ),
                      if (i != _titlesProps.length - 1)
                        SizedBox(width: widget.barStyle.spaceBetween),
                    ]
                  ]),
                ),
                if (widget.showIdentifier)
                  Positioned(
                    bottom: 0,
                    height: widget.identiferStyle.height,
                    width: _identifier.width,
                    left: _identifier.position,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.identiferStyle.color,
                        borderRadius: widget.identiferStyle.borderRadius,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        widget.showMoreCategories
            ? Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: widget.barStyle.padding.top,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0), //阴影x轴偏移量
                          blurRadius: 10, //阴影模糊程度
                          spreadRadius: 0 //阴影扩散程度
                          )
                    ],
                  ),
                  child: GestureDetector(
                    child: Icon(Icons.plus_one),
                    onTap: () {
                      widget.getMoreCategores();
                    },
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Text _createTextLerp(int index, double lerp) {
    return Text(
      widget.titles[index],
      key: _titlesProps[index].key,
      maxLines: 1,
      style: TextStyle(
        color: Color.lerp(
          widget.barStyle.deactiveColor,
          widget.barStyle.activeColor,
          lerp,
        ),
      ).merge(widget.barStyle.style),
    );
  }
}
