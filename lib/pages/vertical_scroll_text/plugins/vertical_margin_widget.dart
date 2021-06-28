import 'package:flutter/material.dart';

//公告栏动画 垂直淡入淡出
class MyNoticeVecAnimation extends StatefulWidget {
  final Duration duration;
  final List<String> messages;

  const MyNoticeVecAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 3000),
    required this.messages,
  }) : super(key: key);

  @override
  _MyNoticeVecAnimationState createState() {
    // TODO: implement createState
    return _MyNoticeVecAnimationState();
  }
}

class _MyNoticeVecAnimationState extends State<MyNoticeVecAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  int _nextMassage = 0;

  //透明度
  late Animation<double> _opacityAni1, _opacityAni2;

  //位移
  late Animation<Offset> _positionAni1, _positionAni2;

  @override
  Widget build(BuildContext context) {
    _startVerticalAni();
    //正向开启动画
    // TODO: implement build
    return SlideTransition(
      position: _positionAni2,
      child: FadeTransition(
        opacity: _opacityAni2,
        child: SlideTransition(
          position: _positionAni1,
          child: FadeTransition(
            opacity: _opacityAni1,
            child: Text(
              widget.messages[_nextMassage],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  //纵向滚动
  void _startVerticalAni() {
    // TODO: implement initState
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _opacityAni1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.linear)),
    );

    _opacityAni2 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.9, 1.0, curve: Curves.linear)),
    );

    _positionAni1 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.0, 0.1, curve: Curves.linear)),
    );

    _positionAni2 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.9, 1.0, curve: Curves.linear)),
    );

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _nextMassage++;
            if (_nextMassage >= widget.messages.length) {
              _nextMassage = 0;
            }
          });
          _controller.reset();
          _controller.forward();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  //释放
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
