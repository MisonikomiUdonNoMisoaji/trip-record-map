import 'package:flutter/material.dart';

import '../main.dart';

class MapBody extends StatelessWidget {
  MapBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width;

    // TODO: これはテストデータ
    final List<PrefectureNamePositionData> prefectureNamePositionDataList = [
      PrefectureNamePositionData(1400 / 1523, 1400 / 1523, "テストだよー")
    ];

    return // 拡大縮小可能な日本地図
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
                    child: Text('${data.message}'))
            ],
          )),
    );
  }
}
