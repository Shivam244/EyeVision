import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'helper.dart';

class DotsItem extends StatefulWidget {
  const DotsItem(
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
  State<DotsItem> createState() => _ChartItemMixedState();
}

List<Widget> chartItems = [];

class _ChartItemMixedState extends State<DotsItem> {
  String mode = 'Normal';
  String distance = '5';
  bool initialState = true;
  checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '5';
    String cons =
        await Helper.getData('constant$distance${widget.textLeft}') ?? '0.0';
    var constant = double.parse(cons);
    print("mode: " +
        mode +
        " distance: " +
        distance +
        " constant$distance${widget.textLeft}: " +
        constant.toString());
    setState(() {});
  }

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat/4 * MM_60 * 3.7795275591 * 0.846;
    } else if (type == "6/36") {
      return feat/4 * MM_36 * 3.7795275591 * 0.846;
    } else if (type == "6/24") {
      return feat/4 * MM_24 * 3.7795275591 * 0.846;
    } else if (type == "6/18") {
      return feat/4 * MM_18 * 3.7795275591 * 0.846;
    } else if (type == "6/12") {
      return feat/4 * MM_12 * 3.7795275591 * 0.846;
    } else if (type == "6/9") {
      return feat/4 * MM_9 * 3.7795275591 * 0.846;
    } else if (type == "6/6") {
      return feat/4 * MM_6 * 3.7795275591 * 0.846;
    }
    return 0;
  }

  getFont() {
    if (widget.type == 'Tamil') {
      return 'Tamil';
    } else if (widget.type == 'Telegu') {
      return 'Telugu';
    } else if (widget.type == 'Hindi') {
      return 'Hindi';
    } else if (widget.type == 'Allen') {
      return 'Prototype';
    } else if (widget.type == 'Numbers') {
      return 'Russian';
    } else if (widget.type == 'Dots') {
      return 'Dots';
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
                        widget.imageSize,
                    color: Colors.black),
                textScaleFactor: 1.0,
              )),
        );
      } else {
        chartItems.add(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Icon(Icons.arrow_downward),
            Container(
              // padding: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              height: calculatePixel(int.parse(distance), widget.textLeft) + 40,
              width: calculatePixel(int.parse(distance), widget.textLeft) + 40,
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey))),
              child: Text(
                widget.images[i],
                style: TextStyle(
                    fontFamily: getFont(),
                    fontSize: widget.imageSize,
                    color: Colors.black),
                textScaleFactor: 1.0,
              ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // padding: const EdgeInsets.all(20.0),
          // height: calculatePixel(int.parse(distance), widget.textLeft) + 40,
          // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.keyboard_arrow_left),
                  Text(widget.textLeft, style: TextStyle(fontSize: 20)),
                ],
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: chartItems,
                )),
              ),
              Row(children: [
                Text(
                  widget.textRight,
                  style: TextStyle(fontSize: 20),
                ),
                const Icon(Icons.keyboard_arrow_right)
              ])
            ],
          ),
        ),
      ],
    );
  }
}
