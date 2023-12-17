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
  List<String> types = [
    '6/60',
    '6/48',
    '6/38',
    '6/36',
    '6/30',
    '6/24',
    '6/19',
    '6/18',
    '6/15',
    '6/12',
    '6/9.5',
    '6/9',
    '6/7.5',
    '6/6',
    '6/5',
    '6/4'
  ];
  int currentType = 0;
  FocusNode item1Focus = FocusNode();
  String cons60 = '0.0';
  String cons48 = '0.0';
  String cons38 = '0.0';
  String cons36 = '0.0';
  String cons30 = '0.0';
  String cons24 = '0.0';
  String cons19 = '0.0';
  String cons18 = '0.0';
  String cons15 = '0.0';
  String cons12 = '0.0';
  String cons9_5 = '0.0';
  String cons9 = '0.0';
  String cons7_5 = '0.0';
  String cons6 = '0.0';
  String cons5 = '0.0';
  String cons4 = '0.0';
  Future<bool>? _dataLoaded;

  @override
  void initState() {
    checkMode();
    _dataLoaded = checkMode1();
    super.initState();
  }

  Future<bool> checkMode() async {
    // dist = await Helper.getData('distance') ?? '5';
    dist = '10';
    distance = double.parse(dist);
    String cons =
        await Helper.getData('constant$dist${types[currentType]}') ?? '0.0';
    constant = double.parse(cons);
    print("constant$dist${types[currentType]} : " + constant.toString());
    return true;
    // setState(() {});
  }

  Future<bool> checkMode1() async {
    dist = '10';
    cons60 = await Helper.getData('constant10' '6/60') ?? '0.0';
    cons48 = await Helper.getData('constant10' '6/48') ?? '0.0';
    cons38 = await Helper.getData('constant10' '6/38') ?? '0.0';
    cons36 = await Helper.getData('constant10' '6/36') ?? '0.0';
    cons30 = await Helper.getData('constant10' '6/30') ?? '0.0';
    cons24 = await Helper.getData('constant10' '6/24') ?? '0.0';
    cons19 = await Helper.getData('constant10' '6/19') ?? '0.0';
    cons18 = await Helper.getData('constant10' '6/18') ?? '0.0';
    cons15 = await Helper.getData('constant10' '6/15') ?? '0.0';
    cons9_5 = await Helper.getData('constant10' '6/9.5') ?? '0.0';
    cons9 = await Helper.getData('constant10' '6/9') ?? '0.0';
    cons7_5 = await Helper.getData('constant10' '6/7.5') ?? '0.0';
    cons6 = await Helper.getData('constant10' '6/6') ?? '0.0';
    cons5 = await Helper.getData('constant10' '6/5') ?? '0.0';
    cons4 = await Helper.getData('constant10' '6/4') ?? '0.0';
    constant = double.parse(cons60);
    return true;
    // setState(() {});
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
    } else if (type == "6/30") {
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
    } else if (type == "6/4") {
      return feat / 4 * MM_4 * 3.7795275591 * 0.846 + constant;
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
    if (right && currentType < 15) {
      currentType++;
    } else if (!right && currentType > 0) {
      currentType--;
    }
    getCurrentCons();
    setState(() {});
  }

  getCurrentCons() {
    switch (currentType) {
      case 0:
        constant = double.parse(cons60);
        break;
      case 1:
        constant = double.parse(cons48);
        break;
      case 2:
        constant = double.parse(cons38);
        break;
      case 3:
        constant = double.parse(cons36);
        break;
      case 4:
        constant = double.parse(cons30);
        break;
      case 5:
        constant = double.parse(cons24);
        break;
      case 6:
        constant = double.parse(cons19);
        break;
      case 7:
        constant = double.parse(cons18);
        break;
      case 8:
        constant = double.parse(cons15);
        break;
      case 9:
        constant = double.parse(cons12);
        break;
      case 10:
        constant = double.parse(cons9_5);
        break;
      case 11:
        constant = double.parse(cons9);
        break;
      case 12:
        constant = double.parse(cons7_5);
        break;
      case 13:
        constant = double.parse(cons6);
        break;
      case 14:
        constant = double.parse(cons5);
        break;
      case 15:
        constant = double.parse(cons4);
        break;
      default:
    }
  }

  setCurrentCons() {
    switch (currentType) {
      case 0:
        cons60 = constant.toString();
        break;
      case 1:
        cons48 = constant.toString();
        break;
      case 2:
        cons38 = constant.toString();
        break;
      case 3:
        cons36 = constant.toString();
        break;
      case 4:
        cons30 = constant.toString();
        break;
      case 5:
        cons24 = constant.toString();
        break;
      case 6:
        cons19 = constant.toString();
        break;
      case 7:
        cons18 = constant.toString();
        break;
      case 8:
        cons15 = constant.toString();
        break;
      case 9:
        cons12 = constant.toString();
        break;
      case 10:
        cons9_5 = constant.toString();
        break;
      case 11:
        cons9 = constant.toString();
        break;
      case 12:
        cons7_5 = constant.toString();
        break;
      case 13:
        cons6 = constant.toString();
        break;
      case 14:
        cons5 = constant.toString();
        break;
      case 15:
        cons4 = constant.toString();
        break;
      default:
    }
  }

  waitForWidget() {
    return FutureBuilder<bool>(
        future: _dataLoaded,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return getWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getWidget() {
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
                  // checkMode();
                  changeType(false);
                }),
                RightButtonIntent: CallbackAction(onInvoke: (intent) {
                  // checkMode();
                  changeType(true);
                }),
                EnterButtonIntent:
                    CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
                  Helper.removeData('constant$dist${types[currentType]}');
                  Helper.setData('constant$dist${types[currentType]}',
                      constant.toString());
                  setCurrentCons();
                  print('constant$dist${types[currentType]} : ' +
                      constant.toString());
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

  @override
  Widget build(BuildContext context) {
    return waitForWidget();
  }
}
