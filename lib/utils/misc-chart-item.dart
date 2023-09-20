import 'dart:math';
import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';

class MiscChartItem extends StatefulWidget {
  const MiscChartItem(
      {super.key,
      required this.textLeft,
      required this.textRight,
      required this.rotations,
      required this.image,
      required this.imageSize,
      required this.language,
      required this.background});
  final String textLeft;
  final String textRight;
  final List<int> rotations;
  final String image;
  final double imageSize;
  final String language;
  final String background;

  @override
  State<MiscChartItem> createState() => _ChartItemState();
}

List<Widget> chartItems = [];

class _ChartItemState extends State<MiscChartItem> {
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

  double calculatePixel(int feat) {
    if (feat == 5) {
      return 182.25637795492;
    } else {
      double prev = calculatePixel(feat - 1);
      return prev * (1 + (5 / 100));
    }
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
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.background == 'black'
                          ? Colors.black
                          : Colors.white),
                  child: Image.asset(
                    widget.image,
                    height: calculatePixel(int.parse(distance)),
                  ),
                ))));
      } else {
        chartItems.add(RotationTransition(
            turns: widget.image.length > 1 || widget.rotations[0] == -1
                ? AlwaysStoppedAnimation(0 / 360)
                : AlwaysStoppedAnimation(next() / 360),
            // child: Image.asset(widget.image, height: widget.imageSize,)));
            child: Container(
              decoration: BoxDecoration(
                  color: widget.background == 'black'
                      ? Colors.black
                      : Colors.white),
              child: Image.asset(
                widget.image,
                height: calculatePixel(int.parse(distance)),
              ),
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
    print("Current sizze:  + ${calculatePixel(int.parse(distance))}");
    return Container(
      decoration: BoxDecoration(
          color: widget.background == 'black' ? Colors.black : Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Icon(Icons.keyboard_arrow_left,
              //     color: widget.background == 'black'
              //         ? Colors.white
              //         : Colors.black),
              Text(widget.textLeft,
                  style: TextStyle(
                      fontSize: 20,
                      color: widget.background == 'black'
                          ? Colors.white
                          : Colors.black)),
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
            // Icon(Icons.keyboard_arrow_right,
            //     color:
            //         widget.background == 'black' ? Colors.white : Colors.black)
          ])
        ],
      ),
    );
  }
}
