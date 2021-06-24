import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表页"),
      ),
      body: Center(
        child: Container(
          child: Text("列表页"),
        ),
      ),
    );
    ;
  }
}
