import 'dart:math';

import 'package:eyevision/utils/arrow-chart-item.dart';
import 'package:eyevision/utils/chart-item-mixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem.dart';
import 'login.dart';

class ArrowChartScreen extends StatefulWidget {
  ArrowChartScreen({super.key, required this.type});
  final String type;
  List<ArrowChartItem> chartItemsList = [];
  @override
  State<ArrowChartScreen> createState() => _ArrowChartScreenState();
}

class _ArrowChartScreenState extends State<ArrowChartScreen> {
  int itemIndex = 0;
  late ArrowChartItem currentItem = ArrowChartItem(
    textLeft: '6/60',
    textRight: '20/200',
    images: ['A'],
    imageSize: 279.139392,
    type: widget.type,
    arrowIndex: arrowIndex,
  );
  FocusNode focus = FocusNode();

  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _numbers = '1234567890';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final String _allen = 'EIADFGHCB';
  final Random _rnd = Random();
  bool initialState = true;
  int arrowIndex = 0;
  @override
  void initState() {
    loadImage();
    super.initState();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String getRandomNumber(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _numbers.codeUnitAt(_rnd.nextInt(_numbers.length))));
  String getRandomHindi(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _hindi.codeUnitAt(_rnd.nextInt(_hindi.length))));
  String getRandomSymbol(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _allen.codeUnitAt(_rnd.nextInt(_allen.length))));

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
    currentItem = widget.chartItemsList[itemIndex];
    arrowIndex = 0;
    setState(() {});
  }

  generateItems(int count) {
    List<String> images = [];
    if (widget.type == 'Alphabets') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomString(1));
      }
    } else if (widget.type == 'Numbers') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomNumber(1));
      }
    } else if (widget.type == 'Hindi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomHindi(1));
      }
    } else if (widget.type == 'Allen') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomSymbol(1));
      }
    }
    return images;
  }

  changeArrow(bool next) {
    if (next &&
        arrowIndex < widget.chartItemsList[itemIndex].images.length - 1) {
      arrowIndex++;
    } else if (!next && arrowIndex > 0) {
      arrowIndex--;
    }
    widget.chartItemsList = setOldImage();
    currentItem = widget.chartItemsList[itemIndex];
    setState(() {});
  }

  setImage() {
    List<ArrowChartItem> chartItemsList = [
      ArrowChartItem(
        textLeft: '6/60',
        textRight: '20/200',
        images: generateItems(1),
        imageSize: 279.139392,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/36',
        textRight: '20/120',
        images: generateItems(2),
        imageSize: 167.5479733848944,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/24',
        textRight: '20/80',
        images: generateItems(3),
        imageSize: 111.59206787241891,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/18',
        textRight: '20/60',
        images: generateItems(4),
        imageSize: 83.7739866924472,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/12',
        textRight: '20/40',
        images: generateItems(5),
        imageSize: 55.955905512475496,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/6',
        textRight: '20/20',
        images: generateItems(6),
        imageSize: 27.818078130616847,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
    ];
    return chartItemsList;
  }

  setOldImage() {
    List<ArrowChartItem> chartItemsListOld = widget.chartItemsList;
    List<ArrowChartItem> chartItemsList = [
      ArrowChartItem(
        textLeft: '6/60',
        textRight: '20/200',
        images: chartItemsListOld[0].images,
        imageSize: 279.139392,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/36',
        textRight: '20/120',
        images: chartItemsListOld[1].images,
        imageSize: 167.5479733848944,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/24',
        textRight: '20/80',
        images: chartItemsListOld[2].images,
        imageSize: 111.59206787241891,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/18',
        textRight: '20/60',
        images: chartItemsListOld[3].images,
        imageSize: 83.7739866924472,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/12',
        textRight: '20/40',
        images: chartItemsListOld[4].images,
        imageSize: 55.955905512475496,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
      ArrowChartItem(
        textLeft: '6/6',
        textRight: '20/20',
        images: chartItemsListOld[5].images,
        imageSize: 27.818078130616847,
        type: widget.type,
        arrowIndex: arrowIndex,
      ),
    ];
    return chartItemsList;
  }

  loadImage() {
    widget.chartItemsList = setImage();
    currentItem = widget.chartItemsList[itemIndex];
  }

  @override
  Widget build(BuildContext context) {
    // loadImage();
    FocusScope.of(context).requestFocus(focus);
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
                UpButtonIntent: CallbackAction<UpButtonIntent>(
                    onInvoke: (intent) => changeItem(true)),
                DownButtonIntent: CallbackAction<DownButtonIntent>(
                    onInvoke: (intent) => changeItem(false)),
                RightButtonIntent: CallbackAction<RightButtonIntent>(
                    onInvoke: (intent) => changeArrow(true)),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => changeArrow(false)),
              },
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }
}
