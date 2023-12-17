import 'dart:math';
import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';

class ChartItemSingle extends StatefulWidget {
  const ChartItemSingle(
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
  final List<String> image;
  final double imageSize;
  final String language;

  @override
  State<ChartItemSingle> createState() => _ChartItemSingleState();
}

List<Widget> chartItems = [];

class _ChartItemSingleState extends State<ChartItemSingle> {
  String mode = 'Normal';
  String distance = '5';
  double constant = 0;
  @override
  initState() {
    checkMode();
    super.initState();
  }

  checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '';
    String cons = await Helper.getData('constant$distance') ?? '0.0';
    constant = double.parse(cons);
    // constant = 0;
    print("mode: " + mode + " distance: " + distance +" constant: "+ constant.toString());
    setState(() {});
  }

  // double calculatePixel(int feat, String type) {
  //   if (type == "6/60") {
  //     return feat / 4 * MM_60 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/36") {
  //     return feat / 4 * MM_36 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/24") {
  //     return feat / 4 * MM_24 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/18") {
  //     return feat / 4 * MM_18 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/12") {
  //     return feat / 4 * MM_12 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/9") {
  //     return feat / 4 * MM_9 * 3.7795275591 * 0.846 + constant;
  //   } else if (type == "6/6") {
  //     return feat / 4 * MM_6 * 3.7795275591 * 0.846 + constant;
  //   }
  //   return 0;
  // }
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
    } else if (type == "6/4") {
      calculatedSize = feat / 4 * MM_4 * 3.7795275591 * 0.846 + constant;
    }
    double finalSize = getConstant(widget.language, calculatedSize);
    return finalSize;
  }

  getFont() {
    if (widget.language == 'Tamil') {
      return 'Tamil';
    } else if (widget.language == 'Telugu') {
      return 'Telugu';
    } else if (widget.language == 'Hindi') {
      return 'Hindi';
    } else if (widget.language == 'Allen') {
      return 'Prototype';
    } else if (widget.language == 'Numbers') {
      return 'Russian';
    } else if (widget.language == 'Dots') {
      return 'Dots';
    } else if (widget.language == 'Arabic') {
      return 'Arabic';
    } else if (widget.language == 'Assamese') {
      return 'Assamese';
    } else if (widget.language == 'Bengali') {
      return 'Bengali';
    } else if (widget.language == 'Gujrati') {
      return 'Gujrati';
    } else if (widget.language == 'Kannada') {
      return 'Kannada';
    } else if (widget.language == 'Malayalam') {
      return 'Malyalam';
    } else if (widget.language == 'Nepali') {
      return 'Nepali';
    } else if (widget.language == 'Oriya') {
      return 'Oriya';
    } else if (widget.language == 'Punjabi') {
      return 'Punjabi';
    } else if (widget.language == 'Urdu') {
      return 'Urdu';
    } else {
      return 'Sloan';
    }
  }

  createChart() {
    chartItems = [];
    for (var i = 0; i < widget.image.length; i++) {
      if (mode == 'Reverse') {
        chartItems.add(Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: RotationTransition(
              turns: widget.image[0].length > 1 || widget.rotations[0] == -1
                  ? AlwaysStoppedAnimation(0 / 360)
                  : AlwaysStoppedAnimation(next() / 360),
              // child: Image.asset(widget.image, height: widget.imageSize,)));
              child: widget.image[0].length > 1
                  ? Image.asset(
                      widget.image[i],
                      height: widget.imageSize,
                    )
                  : Text(
                      widget.image[i],
                      style: TextStyle(
                          fontFamily: getFont(),
                          // fontSize: widget.imageSize,
                          fontSize: widget.imageSize,
                          color: Colors.black),
                      textScaleFactor: 1.0,
                    )),
        ));
      } else {
        chartItems.add(RotationTransition(
            turns: widget.image[0].length > 1 || widget.rotations[0] == -1
                ? AlwaysStoppedAnimation(0 / 360)
                : AlwaysStoppedAnimation(next() / 360),
            // child: Image.asset(widget.image, height: widget.imageSize,)));
            child: widget.image[0].length > 1
                ? Image.asset(
                    widget.image[i],
                    height: widget.imageSize,
                  )
                : Text(
                    widget.image[i],
                    style: TextStyle(
                        fontFamily: getFont(),
                        fontSize: widget.imageSize,
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
    return Center(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: chartItems,
    ));
    // return Center(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Row(
    //         children: [
    //           // const Icon(Icons.keyboard_arrow_left),
    //           Text(widget.textLeft, style: TextStyle(fontSize: 20)),
    //         ],
    //       ),
    //       Center(
    //           child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: chartItems,
    //       )),
    //       Row(children: [
    //         Text(
    //           widget.textRight,
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         // const Icon(Icons.keyboard_arrow_right)
    //       ])
    //     ],
    //   ),
    // );
  }
}
