import 'dart:math';

import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({super.key, required this.image});
  final String image;
  @override
  State<ChartScreen> createState() => _ChartScreenState();
  List<ChartItem> chartItemsList = [];
}

class _ChartScreenState extends State<ChartScreen> {
  int itemIndex = 0;
  late ChartItem currentItem;
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  changeItem(bool next) {
    if (next) {
      itemIndex++;
      if (itemIndex >= widget.chartItemsList.length) {
        itemIndex = widget.chartItemsList.length - 1;
      }
    } else {
      itemIndex--;
      if (itemIndex < 0) {
        itemIndex = 0;
      }
    }
    setState(() {});
  }

  setImage(String image) {
    List<ChartItem> chartItemsList = [
      ChartItem(
          textLeft: '6/60',
          textRight: '20/200',
          rotations: enableRotation ? [0] : [-1],
          image: image,
          imageSize: 279.139392,
          language: widget.image),
      ChartItem(
          textLeft: '6/36',
          textRight: '20/120',
          rotations: enableRotation ? [0, 0] : [-1, -1],
          image: image,
          imageSize: 167.5479733848944,
          language: widget.image),
      ChartItem(
          textLeft: '6/24',
          textRight: '20/80',
          rotations: enableRotation ? [270, 270, 0] : [-1, -1, -1],
          image: image,
          imageSize: 111.59206787241891,
          language: widget.image),
      ChartItem(
          textLeft: '6/18',
          textRight: '20/60',
          rotations: enableRotation ? [0, 270, 90, 0] : [-1, -1, -1, -1],
          image: image,
          imageSize: 83.7739866924472,
          language: widget.image),
      ChartItem(
          textLeft: '6/12',
          textRight: '20/40',
          rotations:
              enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
          image: image,
          imageSize: 55.955905512475496,
          language: widget.image),
      ChartItem(
          textLeft: '6/6',
          textRight: '20/20',
          rotations: enableRotation
              ? [0, 15, 270, 180, 90, 0]
              : [-1, -1, -1, -1, -1, -1],
          image: image,
          imageSize: 27.818078130616847,
          language: widget.image),
    ];
    return chartItemsList;
  }

  final String _chars = 'AaBCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZzb';
  final String _numbers = '1234567890';
  final String _tamil = 'அஆஇஈஉஊஎஏஐஒஓஔகஙசஞடணதநனபமயரறலளழவ';
  final String _telugu = 'అఆఇఈఉఊఋఌఎఏఐఒఓఔకఖగఘఙచఛజఝఞటఠడఢణతథదధనపఫబభమయరఱలళఴవశషసహ';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String getRandomNumber(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _numbers.codeUnitAt(_rnd.nextInt(_numbers.length))));
  String getRandomTamil(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _tamil.codeUnitAt(_rnd.nextInt(_tamil.length))));
  String getRandomTelugu(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _telugu.codeUnitAt(_rnd.nextInt(_telugu.length))));
  String getRandomHindi(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _hindi.codeUnitAt(_rnd.nextInt(_hindi.length))));

  loadImage() {
    String itemImage = widget.image;
    if (widget.image == 'Letters') {
      itemImage = getRandomString(1);
      enableRotation = true;
    } else if (widget.image == 'Numbers') {
      itemImage = getRandomNumber(1);
      enableRotation = true;
    } else if (widget.image == 'Tamil') {
      itemImage = getRandomTamil(1);
      enableRotation = false;
    } else if (widget.image == 'Telugu') {
      itemImage = getRandomTelugu(1);
      enableRotation = false;
    } else if (widget.image == 'Hindi') {
      itemImage = getRandomHindi(1);
      enableRotation = false;
    }
    widget.chartItemsList = setImage(itemImage);
    currentItem = widget.chartItemsList[itemIndex];
    FocusScope.of(context).requestFocus(focus);
    widget.chartItemsList.forEach((element) {
      print(element.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadImage();
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
                RightButtonIntent: CallbackAction<RightButtonIntent>(
                    onInvoke: (intent) => changeItem(true)),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => changeItem(false)),
              },
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }
}
