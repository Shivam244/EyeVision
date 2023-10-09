import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../utils/helper.dart';
import 'login.dart';

class CallibrationScreen extends StatefulWidget {
  const CallibrationScreen({super.key, required this.type});
  final String type;

  @override
  State<CallibrationScreen> createState() => _CallibrationScreenState();
}

class _CallibrationScreenState extends State<CallibrationScreen> {
  double distance = 0;
  double constant = 0;
  String dist = '0';
  List<String> types = ['6/60', '6/48', '6/38', '6/30', '6/36', '6/24', '6/19', 
  '6/15', '6/12', '9.5', '6/9', '7.5', '6/6', '6/5'];
  int currentType = 0;
  FocusNode item1Focus = FocusNode();

  @override
  void initState() {
    checkMode();
    super.initState();
  }

  checkMode() async {
    dist = await Helper.getData('distance') ?? '5';
    distance = double.parse(dist);
    String cons = await Helper.getData('constant$dist${types[currentType]}') ?? '0.0';
    constant = double.parse(cons);
    print("constant$dist${types[currentType]} : "+ constant.toString());
    setState(() {});
  }

  final Random _rnd = Random();
  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat / 4 * MM_60 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/48") {
      return feat / 4 * MM_48 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/38") {
      return feat / 4 * MM_38 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/36") {
      return feat / 4 * MM_36 * 3.7795275591 * 0.846 + constant;
    }else if (type == "6/30") {
      return feat / 4 * MM_30 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/24") {
      return feat / 4 * MM_24 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/19") {
      return feat / 4 * MM_19 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/18") {
      return feat / 4 * MM_18 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/15") {
      return feat / 4 * MM_15 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/12") {
      return feat / 4 * MM_12 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/9.5") {
      return feat / 4 * MM_9_5 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/9") {
      return feat / 4 * MM_9 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/7.5") {
      return feat / 4 * MM_7_5 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/6") {
      return feat / 4 * MM_6 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/5") {
      return feat / 4 * MM_5 * 3.7795275591 * 0.846 + constant;
    }
    return 0;
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

  changeType(bool right) {
    if (right && currentType < 13) {
      currentType++;
    } else if (!right && currentType > 0) {
      currentType--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
            },
            child: Actions(
              actions: <Type, Action<Intent>>{
                UpButtonIntent: CallbackAction(onInvoke: (intent) {
                  constant = constant + 1;
                  setState(() {
                    // constant = distance;
                  });
                }),
                DownButtonIntent: CallbackAction(onInvoke: (intent) {
                  constant = constant - 1;
                  setState(() {
                    // constant = distance;
                  });
                }),
                LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                  checkMode();
                  changeType(false);
                }),
                RightButtonIntent: CallbackAction(onInvoke: (intent) {
                  checkMode();
                  changeType(true);
                }),
                EnterButtonIntent:
                    CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
                  Helper.removeData('constant$dist${types[currentType]}');
                  Helper.setData(
                      'constant$dist${types[currentType]}', constant.toString());
                      print( 'constant$dist${types[currentType]} : '+ constant.toString());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Callibration Saved'),
                  ));
                  // Navigator.pop(context);
                }),
              },
              child: Focus(
                focusNode: item1Focus,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      Container(
                        height: constraints.maxHeight,
                        width: MediaQuery.of(context).size.width / 2,
                        color: backgroundColour,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 100,
                                      child: IconButton(
                                        onPressed: () =>
                                            {if (distance < 20) distance++},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Color.fromARGB(
                                              137, 216, 215, 215),
                                        ),
                                        iconSize: 50,
                                      )),
                                  Container(
                                      height: 30,
                                      width: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          color:
                                              Color.fromARGB(94, 37, 37, 37)),
                                      child: Text(
                                        constant.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                  Container(
                                      height: 100,
                                      child: IconButton(
                                          onPressed: () =>
                                              {if (distance > 5) distance--},
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Color.fromARGB(
                                                137, 216, 215, 215),
                                          ),
                                          iconSize: 50)),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 100,
                                      child: IconButton(
                                        onPressed: () =>
                                            {if (distance < 20) distance++},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_left,
                                          color: Color.fromARGB(
                                              137, 216, 215, 215),
                                        ),
                                        iconSize: 50,
                                      )),
                                  Container(
                                      height: 30,
                                      width: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          color:
                                              Color.fromARGB(94, 37, 37, 37)),
                                      child: Text(
                                        types[currentType],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                  Container(
                                      height: 100,
                                      child: IconButton(
                                          onPressed: () =>
                                              {if (distance > 5) distance--},
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Color.fromARGB(
                                                137, 216, 215, 215),
                                          ),
                                          iconSize: 50)),
                                ]),
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight,
                        width: MediaQuery.of(context).size.width / 2,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            widget.type == 'C' ? 'C' : getRandomString(1),
                            style: TextStyle(
                                fontFamily: getFont(),
                                // fontSize: widget.imageSize,
                                fontSize: calculatePixel(
                                    distance.toInt(), types[currentType]),
                                color: Colors.black),
                            textScaleFactor: 1.0,
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            )));
  }
}
