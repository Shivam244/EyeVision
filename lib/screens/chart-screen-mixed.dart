import 'dart:math';

import 'package:eyevision/utils/chart-item-mixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem.dart';
import 'login.dart';

class ChartScreenMixed extends StatefulWidget {
  ChartScreenMixed({super.key, required this.type});
  final String type;
  List<ChartItemMixed> chartItemsList = [];
  @override
  State<ChartScreenMixed> createState() => _ChartScreenMixedState();
}

class _ChartScreenMixedState extends State<ChartScreenMixed> {
  int itemIndex = 0;
  late ChartItemMixed currentItem =  ChartItemMixed(
      textLeft: '6/60',
      textRight: '20/200',
      images: ['A'],
      imageSize: 279.139392,
      type: widget.type);
  FocusNode focus = FocusNode();
  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _numbers = '1234567890';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final Random _rnd = Random();
  bool initialState = true;
  @override
  void initState() {
    // loadImage();
    super.initState();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String getRandomNumber(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _numbers.codeUnitAt(_rnd.nextInt(_numbers.length))));
  String getRandomHindi(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _hindi.codeUnitAt(_rnd.nextInt(_hindi.length))));

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
    }
    return images;
  }

  setImage() {
    if (widget.chartItemsList.isNotEmpty) {
      return widget.chartItemsList;
    }
    List<ChartItemMixed> chartItemsList = [
      ChartItemMixed(
          textLeft: '6/60',
          textRight: '20/200',
          images: generateItems(1),
          imageSize: 279.139392,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/36',
          textRight: '20/120',
          images: generateItems(2),
          imageSize: 167.5479733848944,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/24',
          textRight: '20/80',
          images: generateItems(3),
          imageSize: 111.59206787241891,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/18',
          textRight: '20/60',
          images: generateItems(4),
          imageSize: 83.7739866924472,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/12',
          textRight: '20/40',
          images: generateItems(5),
          imageSize: 55.955905512475496,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/6',
          textRight: '20/20',
          images: generateItems(6),
          imageSize: 27.818078130616847,
          type: widget.type),
    ];
    return chartItemsList;
  }

  loadImage() {
    widget.chartItemsList.forEach((element) {
      print(element.images);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initialState) {
      initialState = false;
      setState(() {
        
      });
    }
    widget.chartItemsList = setImage();
    currentItem = widget.chartItemsList[itemIndex];
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
                RightButtonIntent: CallbackAction<RightButtonIntent>(
                    onInvoke: (intent) => changeItem(true)),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => changeItem(false)),
              },
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }
}
