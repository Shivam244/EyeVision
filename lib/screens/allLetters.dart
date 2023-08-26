import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../utils/helper.dart';
import 'login.dart';

class AllLettersScreen extends StatefulWidget {
  const AllLettersScreen({super.key, required this.type});
  final String type;

  @override
  State<AllLettersScreen> createState() => _CallibrationScreenState();
}

class _CallibrationScreenState extends State<AllLettersScreen> {
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
        body: Center(
          child: Text(
            'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',
            style: TextStyle(
                fontFamily: getFont(),
                fontSize: calculatePixel(int.parse('5'), "6/60"),
                color: Colors.black),
            textScaleFactor: 1.0,
          ),
        ));
  }
}
