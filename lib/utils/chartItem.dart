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
      required this.imageSize,
      required this.language});
  final String textLeft;
  final String textRight;
  final List<int> rotations;
  final String image;
  final double imageSize;
  final String language;

  @override
  State<ChartItem> createState() => _ChartItemState();
}

List<Widget> chartItems = [];

class _ChartItemState extends State<ChartItem> {
  String mode = 'Normal';
  String distance = '5';

  @override
  initState() {
    checkMode();
    super.initState();
  }

  checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '';
    print("mode: " + mode + " distance: " + distance);
    setState(() {
      
    });
  }

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat / 4 * MM_60 * 3.7795275591 * 0.846;
    } else if (type == "6/36") {
      return feat / 4 * MM_36 * 3.7795275591 * 0.846;
    } else if (type == "6/24") {
      return feat / 4 * MM_24 * 3.7795275591 * 0.846;
    } else if (type == "6/18") {
      return feat / 4 * MM_18 * 3.7795275591 * 0.846;
    } else if (type == "6/12") {
      return feat / 4 * MM_12 * 3.7795275591 * 0.846;
    } else if (type == "6/9") {
      return feat / 4 * MM_9 * 3.7795275591 * 0.846;
    } else if (type == "6/6") {
      return feat / 4 * MM_6 * 3.7795275591 * 0.846;
    }
    return 0;
  }

  getFont() {
    if (widget.language == 'Tamil') {
      return 'Tamil';
    } else if (widget.language == 'Telegu') {
      return 'Telugu';
    } else if (widget.language == 'Hindi') {
      return 'Hindi';
    } else if (widget.language == 'Allen') {
      return 'Prototype';
    } else {
      return 'Sloan';
    }
  }

  createChart() {
    chartItems = [];
    for (var i = 0;
        (widget.rotations[0] == -1) ? i < 1 : i < widget.rotations.length;
        i++) {
      if (mode == 'Reverse') {
        chartItems.add(Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: RotationTransition(
              turns: widget.image.length > 1 || widget.rotations[0] == -1
                  ? AlwaysStoppedAnimation(0 / 360)
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
                          fontFamily: getFont(),
                          // fontSize: widget.imageSize,
                          fontSize: calculatePixel(
                              int.parse(distance), widget.textLeft),
                          color: Colors.black),
                      textScaleFactor: 1.0,
                    )),
        ));
      } else {
        chartItems.add(RotationTransition(
            turns: widget.image.length > 1 || widget.rotations[0] == -1
                ? AlwaysStoppedAnimation(0 / 360)
                : AlwaysStoppedAnimation(next() / 360),
            // child: Image.asset(widget.image, height: widget.imageSize,)));
            child: widget.image.length > 1
                ? Image.asset(
                    widget.image,
                    height: MediaQuery.of(context).size.height,
                  )
                : Text(
                    widget.image,
                    style: TextStyle(
                        fontFamily: getFont(),
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
  var list = [0, 90, 180, 270, 360];
  // int next() => 0 + _random.nextInt(360 - 0);
  int next() => list[_random.nextInt(list.length)];

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
