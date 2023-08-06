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
  FocusNode item1Focus = FocusNode();

  @override
  void initState() {
    checkMode();
    super.initState();
  }

  checkMode() async {
    var cons = await Helper.getData('constant${widget.type}') ?? '0.0';
    constant = double.parse(cons);
    distance = constant;
    setState(() {});
  }

  final Random _rnd = Random();
  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat / 4 * MM_60 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/36") {
      return feat / 4 * MM_36 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/24") {
      return feat / 4 * MM_24 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/18") {
      return feat / 4 * MM_18 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/12") {
      return feat / 4 * MM_12 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/9") {
      return feat / 4 * MM_9 * 3.7795275591 * 0.846 + constant;
    } else if (type == "6/6") {
      return feat / 4 * MM_6 * 3.7795275591 * 0.846 + constant;
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
                  distance = distance + 1;
                  setState(() {
                    constant = distance;
                  });
                }),
                DownButtonIntent: CallbackAction(onInvoke: (intent) {
                  distance = distance - 1;
                  setState(() {
                    constant = distance;
                  });
                }),
                EnterButtonIntent:
                    CallbackAction<EnterButtonIntent>(onInvoke: (intent) {
                  Helper.removeData('constant${widget.type}');
                  Helper.setData('constant${widget.type}', constant.toString());
                  Navigator.pop(context);
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
                        child: Row(
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
                                          Icons.arrow_upward_outlined,
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
                                        "$distance",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                  Container(
                                      height: 100,
                                      child: IconButton(
                                          onPressed: () =>
                                              {if (distance > 5) distance--},
                                          icon: const Icon(
                                            Icons.arrow_downward,
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
                            widget.type == 'C'? 'C': 'W',
                            style: TextStyle(
                                fontFamily: getFont(),
                                // fontSize: widget.imageSize,
                                fontSize:
                                    calculatePixel(int.parse('5'), "6/60"),
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
