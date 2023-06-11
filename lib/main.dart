import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'map_body/map_body.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CountModel>(
        create: (context) => CountModel(),
      )
    ],
    child: const MaterialApp(home: MyHomePage()),
  ));
}

// 使わないけど、Providerがないと怒ってくるから仕方なく
class CountModel extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("trip-record-map"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MapBody(),
          ],
        ),
      ),
    );
  }
}

class PrefectureNamePositionData {
  double x, y;
  final String message;
  PrefectureNamePositionData(this.x, this.y, this.message);
}
