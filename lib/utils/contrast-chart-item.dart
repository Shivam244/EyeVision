import 'dart:math';
import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';

class ContastChartItem extends StatefulWidget {
  const ContastChartItem(
      {super.key,
      required this.textLeft,
      required this.textRight,
      required this.rotations,
      required this.images,
      required this.opacity,
      required this.language});
  final String textLeft;
  final String textRight;
  final List<int> rotations;
  final List<String> images;
  final double opacity;
  final String language;

  @override
  State<ContastChartItem> createState() => _ContastChartItemState();
}

List<Widget> chartItems = [];

class _ContastChartItemState extends State<ContastChartItem> {
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
    setState(() {});
  }

  double calculatePixel(int feat, String type) {
    return feat / 4 * MM_60 * 3.7795275591 * 0.846;
  }

  getFont() {
    if (widget.language == 'Tamil') {
      return 'Tamil';
    } else if (widget.language == 'Telegu') {
      return 'Telugu';
    } else if (widget.language == 'Hindi') {
      return 'Hindi';
    } else {
      return 'Sloan';
    }
  }

  Future<void> createChart() async {
    checkMode();
    chartItems = [];
    print(widget.images);
    for (var i = 0; i < widget.images.length; i++) {
      if (mode == 'Reverse') {
        chartItems.add(
          Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Text(
                widget.images[i],
                style: TextStyle(
                    fontFamily: getFont(),
                    // fontSize: widget.imageSize,
                    fontSize:
                        calculatePixel(int.parse('5'), widget.textLeft),
                    color: Colors.black.withOpacity(widget.opacity)),
                textScaleFactor: 1.0,
              )),
        );
      } else {
        chartItems.add(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(Icons.arrow_downward),
            Text(
              widget.images[i],
              style: TextStyle(
                  fontFamily: getFont(),
                  fontSize: calculatePixel(int.parse('5'), widget.textLeft),
                  color: Colors.black.withOpacity(widget.opacity)),
              textScaleFactor: 1.0,
            ),
          ],
        ));
      }
      if (i < widget.images.length - 1) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.keyboard_arrow_left),
            Text("${widget.textLeft}%", style: TextStyle(fontSize: 20)),
          ],
        ),
        Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: chartItems,
        )),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            widget.textRight,
            style: TextStyle(fontSize: 20),
          ),
          const Icon(Icons.keyboard_arrow_right)
        ]),
      ],
    );
  }
}
