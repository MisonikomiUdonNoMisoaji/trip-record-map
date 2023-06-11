import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width;
    final List<PrefectureNamePositionData> prefectureNamePositionDataList = [
      PrefectureNamePositionData(1400 / 1523, 1400 / 1523, "テストだよー")
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 拡大縮小可能な日本地図
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 15,
                  child: Stack(
                    children: [
                      Image.asset('images/japan.png'),
                      for (PrefectureNamePositionData data
                          in prefectureNamePositionDataList)
                        Positioned(
                            left: imageSize * data.x,
                            top: imageSize * data.y,
                            // 画像の拡大率に合わせて、ピン画像のサイズを調整
                            // width: defaultWidth / scale,
                            // height: defaultHeight / scale,
                            child: Text('${data.message}'))
                    ],
                  )),
            ),
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
