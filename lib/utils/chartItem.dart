import 'dart:math';
import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatefulWidget {
  const ChartItem(
      {super.key,
      required this.textLeft,
      required this.textRight,
      required this.rotations,
      required this.image,
      required this.imageSize});
  final String textLeft;
  final String textRight;
  final List<int> rotations;
  final String image;
  final double imageSize;

  @override
  State<ChartItem> createState() => _ChartItemState();
}

List<Widget> chartItems = [];

class _ChartItemState extends State<ChartItem> {
  String mode = '';
  String distance = '5';

  checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '';
    print("mode: " + mode + " distance: " + distance);
  }

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat * MM_60 * 3.7795275591 * 0.846;
    } else if (type == "6/36") {
      return feat * MM_36 * 3.7795275591 * 0.846;
    } else if (type == "6/24") {
      return feat * MM_24 * 3.7795275591 * 0.846;
    } else if (type == "6/18") {
      return feat * MM_18 * 3.7795275591 * 0.846;
    } else if (type == "6/12") {
      return feat * MM_12 * 3.7795275591 * 0.846;
    } else if (type == "6/9") {
      return feat * MM_9 * 3.7795275591 * 0.846;
    } else if (type == "6/6") {
      return feat * MM_6 * 3.7795275591 * 0.846;
    }
    return 0;
  }

  Future<void> createChart() async {
    await checkMode();
    chartItems = [];
    for (var i = 0; i < widget.rotations.length; i++) {
      if (mode == 'Reverse') {
        chartItems.add(Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: RotationTransition(
              turns: widget.image.length > 1
                  ? AlwaysStoppedAnimation(widget.rotations[i] / 360)
                  : AlwaysStoppedAnimation(next() / 360),
              // child: Image.asset(widget.image, height: widget.imageSize,)));
              child: widget.image.length > 1
                  ? Image.asset(
                      widget.image,
                      height: widget.imageSize,
                    )
                  : Text(
                      widget.image,
                      style: TextStyle(
                          fontFamily: 'Sloan',
                          // fontSize: widget.imageSize,
                          fontSize: calculatePixel(
                              int.parse(distance), widget.textLeft),
                          color: Colors.black),
                      textScaleFactor: 1.0,
                    )),
        ));
      } else {
        chartItems.add(RotationTransition(
            turns: widget.image.length > 1
                ? AlwaysStoppedAnimation(widget.rotations[i] / 360)
                : AlwaysStoppedAnimation(next() / 360),
            // child: Image.asset(widget.image, height: widget.imageSize,)));
            child: widget.image.length > 1
                ? Image.asset(
                    widget.image,
                    height: widget.imageSize,
                  )
                : Text(
                    widget.image,
                    style: TextStyle(
                        fontFamily: 'Sloan',
                        fontSize: calculatePixel(
                            int.parse(distance), widget.textLeft),
                        color: Colors.black),
                    textScaleFactor: 1.0,
                  )));
      }
      if (i < widget.rotations.length - 1) {
        chartItems.add(const SizedBox(
          width: 70,
        ));
      }
    }
  }

  final _random = Random();
  int next() => 0 + _random.nextInt(360 - 0);

  @override
  Widget build(BuildContext context) {
    createChart();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.keyboard_arrow_left),
            Text(widget.textLeft, style: TextStyle(fontSize: 20)),
          ],
        ),
        Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: chartItems,
        )),
        Row(children: [
          Text(
            widget.textRight,
            style: TextStyle(fontSize: 20),
          ),
          const Icon(Icons.keyboard_arrow_right)
        ])
      ],
    );
  }
}
