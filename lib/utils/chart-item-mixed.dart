import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'helper.dart';

class ChartItemMixed extends StatefulWidget {
  const ChartItemMixed(
      {super.key,
      required this.textLeft,
      required this.textRight,
      required this.images,
      required this.imageSize,
      required this.type});
  final String textLeft;
  final String textRight;
  final List<String> images;
  final double imageSize;
  final String type;

  @override
  State<ChartItemMixed> createState() => _ChartItemMixedState();
}

List<Widget> chartItems = [];

class _ChartItemMixedState extends State<ChartItemMixed> {
  String mode = 'Normal';
  String distance = '5';
  bool initialState = true;
  double constant = 0;
  checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '';
    var cons = await Helper.getData('constantC') ?? '0.0';
    constant = double.parse(cons);
    // constant = 0;
    print("mode: " + mode + " distance: " + distance);
    setState(() {});
  }

  double calculatePixel(int feat, String type) {
    double calculatedSize = 0;
    if (type == "6/60") {
      calculatedSize = feat / 4 * MM_60 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/36") {
      calculatedSize = feat / 4 * MM_36 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/24") {
      calculatedSize = feat / 4 * MM_24 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/18") {
      calculatedSize = feat / 4 * MM_18 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/12") {
      calculatedSize = feat / 4 * MM_12 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/9") {
      calculatedSize = feat / 4 * MM_9 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/6") {
      calculatedSize = feat / 4 * MM_6 * 3.7795275591 * 0.846 + constant;
    }
    double finalSize = getConstant(widget.type, calculatedSize);
    return finalSize;
  }

  getFont() {
    if (widget.type == 'Tamil') {
      return 'Tamil';
    } else if (widget.type == 'Telugu') {
      return 'Telugu';
    } else if (widget.type == 'Hindi') {
      return 'Hindi';
    } else if (widget.type == 'Allen') {
      return 'Prototype';
    } else if (widget.type == 'Numbers') {
      return 'Russian';
    } else if (widget.type == 'Dots') {
      return 'Dots';
    } else if (widget.type == 'Arabic') {
      return 'Arabic';
    } else if (widget.type == 'Assamese') {
      return 'Assamese';
    } else if (widget.type == 'Bengali') {
      return 'Bengali';
    } else if (widget.type == 'Gujrati') {
      return 'Gujrati';
    } else if (widget.type == 'Kannada') {
      return 'Kannada';
    } else if (widget.type == 'Malayalam') {
      return 'Malyalam';
    } else if (widget.type == 'Nepali') {
      return 'Nepali';
    } else if (widget.type == 'Oriya') {
      return 'Oriya';
    } else if (widget.type == 'Punjabi') {
      return 'Punjabi';
    } else if (widget.type == 'Urdu') {
      return 'Urdu';
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
                        calculatePixel(int.parse(distance), widget.textLeft),
                    color: Colors.black),
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
                  fontSize:
                      calculatePixel(int.parse(distance), widget.textLeft),
                  color: Colors.black),
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
