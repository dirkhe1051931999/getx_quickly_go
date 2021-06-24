import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 适合局部的状态管理，很灵活。
class StateValueBuilderView extends StatelessWidget {
  const StateValueBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('valueBuilder'),
      ),
      body: Center(
        child: Column(
          children: [
            ValueBuilder<int?>(
              initialValue: 10,
              builder: (value, updateFn) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        updateFn(value! + 1);
                      },
                      child: Text('ValueBuilder -> add'),
                    ),
                    Text("count -> " + value.toString()),
                  ],
                );
              },
              onUpdate: (value) => print("Value updated: $value"),
              onDispose: () => print("Widget unmounted"),
            ),
          ],
        ),
      ),
    );
  }
}
