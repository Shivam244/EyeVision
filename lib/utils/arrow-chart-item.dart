import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../screens/login.dart';
import 'helper.dart';

class ArrowChartItem extends StatefulWidget {
  ArrowChartItem(
      {super.key,
      required this.textLeft,
      required this.textRight,
      required this.images,
      required this.imageSize,
      required this.type,
      required this.arrowIndex
      });
  final String textLeft;
  final String textRight;
  final List<String> images;
  final double imageSize;
  final String type;
  int arrowIndex;

  @override
  State<ArrowChartItem> createState() => _ArrowChartItemState();
}

List<Widget> chartItems = [];

class _ArrowChartItemState extends State<ArrowChartItem> {
  String mode = 'Normal';
  String distance = '5';
  bool initialState = true;
  int arrowIndex = 0;
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
    if (widget.type == 'Tamil') {
      return 'Tamil';
    } else if (widget.type == 'Telegu') {
      return 'Telugu';
    } else if (widget.type == 'Hindi') {
      return 'Hindi';
    } else if (widget.type == 'Allen') {
      return 'Prototype';
    } else {
      return 'Sloan';
    }
  }

  void changeArrow(bool next) {
    if (next && arrowIndex < widget.images.length) {
      arrowIndex++;
    } else if (!next && arrowIndex > 0) {
      arrowIndex--;
    }
    setState(() {
      
    });
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
            widget.arrowIndex == i ? const Icon(Icons.arrow_downward, size: 50) : Container(),
            Text(
              widget.images[i],
              style: TextStyle(
                  fontFamily: getFont(),
                  fontSize:
                      widget.imageSize,
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
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
        LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.keyboard_arrow_left),
              Text(widget.textLeft, style: TextStyle(fontSize: 20)),
            ],
          ),
          Center(
              child: Actions(
            actions: <Type, Action<Intent>>{
              UpButtonIntent: CallbackAction(onInvoke: (intent) {}),
              RightButtonIntent: CallbackAction(onInvoke: (intent) {
                changeArrow(true);
              }),
              LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                changeArrow(false);
              }),
              DownButtonIntent: CallbackAction(onInvoke: (intent) {
                // item1Focus.unfocus();
                // changeFocus(context, item5Focus);
              }),
              EnterButtonIntent: CallbackAction(onInvoke: (intent) {}),
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: chartItems,
            ),
          )),
          Row(children: [
            Text(
              widget.textRight,
              style: TextStyle(fontSize: 20),
            ),
            const Icon(Icons.keyboard_arrow_right)
          ])
        ],
      ),
    );
  }
}
