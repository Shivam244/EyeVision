import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem-single.dart';
import '../utils/chartItem.dart';
import 'login.dart';

class RedGreenScreen extends StatefulWidget {
  RedGreenScreen({super.key});

  List<ChartItemSingle> chartItemsList = [];
  @override
  State<RedGreenScreen> createState() => _RedGreenScreenState();
}

class _RedGreenScreenState extends State<RedGreenScreen> {
  int itemIndex = 0;
  late ChartItemSingle currentItem;
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  bool initialState = true;
  String image = 'C';
  List<String> items = ['C', 'E', 'Letters', 'Numbers'];
  int itemTypeIndex = 0;
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
    setState(() {
      initialState = true;
    });
  }

  changeItemType(bool next) {
    if (next) {
      if (itemTypeIndex == items.length - 1) return;
      itemTypeIndex++;
      image = items[itemTypeIndex];
    } else {
      itemTypeIndex--;
      if (itemTypeIndex < 0) {
        itemTypeIndex = 0;
      }
      image = items[itemTypeIndex];
    }
    // loadImage();
    setState(() {
      initialState = true;
    });
  }

  @override
  initState() {
    super.initState();
  }

  setImage(String image1) {
    if (initialState) {
      List<ChartItemSingle> chartItemsList = [
        ChartItemSingle(
            textLeft: '6/60',
            textRight: '20/200',
            rotations: enableRotation ? [0] : [-1],
            image: generateItems(1),
            imageSize: 279.139392,
            language: image),
        ChartItemSingle(
            textLeft: '6/36',
            textRight: '20/120',
            rotations: enableRotation ? [0, 0] : [-1, -1],
            image: generateItems(2),
            imageSize: 167.5479733848944,
            language: image),
        ChartItemSingle(
            textLeft: '6/24',
            textRight: '20/80',
            rotations: enableRotation ? [270, 270, 0] : [-1, -1, -1],
            image: generateItems(3),
            imageSize: 111.59206787241891,
            language: image),
        ChartItemSingle(
            textLeft: '6/18',
            textRight: '20/60',
            rotations: enableRotation ? [0, 270, 90, 0] : [-1, -1, -1, -1],
            image: generateItems(4),
            imageSize: 83.7739866924472,
            language: image),
        ChartItemSingle(
            textLeft: '6/12',
            textRight: '20/40',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: generateItems(5),
            imageSize: 55.955905512475496,
            language: image1),
        ChartItemSingle(
            textLeft: '6/6',
            textRight: '20/20',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            image: generateItems(6),
            imageSize: 27.818078130616847,
            language: image1),
      ];
      initialState = false;
      return chartItemsList;
    } else {
      return widget.chartItemsList;
    }
  }

  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
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

  getRandomImage() {
    String itemImage = image;
    if (image == 'Letters') {
      itemImage = getRandomString(1);
      enableRotation = false;
    } else if (image == 'Numbers') {
      itemImage = getRandomNumber(1);
      enableRotation = false;
    } else if (image == 'Tamil') {
      itemImage = getRandomTamil(1);
      enableRotation = false;
    } else if (image == 'Telugu') {
      itemImage = getRandomTelugu(1);
      enableRotation = false;
    } else if (image == 'Hindi') {
      itemImage = getRandomHindi(1);
      enableRotation = false;
    } 
    return itemImage;
  }

  generateItems(int count) {
    List<String> images = [];
    if (image == 'Letters') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomString(1));
      }
    } else if (image == 'Numbers') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomNumber(1));
      }
    } else if (image == 'Hindi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomHindi(1));
      }
    }else{
      for (int i = 0; i < count; i++) {
        images.add(image);
      }
    }
    return images;
  }

  loadImage() {
    String itemImage = image;
    if (image == 'Letters') {
      itemImage = getRandomString(1);
      enableRotation = false;
    } else if (image == 'Numbers') {
      itemImage = getRandomNumber(1);
      enableRotation = false;
    } else if (image == 'Tamil') {
      itemImage = getRandomTamil(1);
      enableRotation = false;
    } else if (image == 'Telugu') {
      itemImage = getRandomTelugu(1);
      enableRotation = false;
    } else if (image == 'Hindi') {
      itemImage = getRandomHindi(1);
      enableRotation = false;
    }
    widget.chartItemsList = setImage(itemImage);
    currentItem = widget.chartItemsList[itemIndex];
    widget.chartItemsList.forEach((element) {
      print(element.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadImage();
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
                      onInvoke: (intent) => changeItemType(true)),
                  LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                      onInvoke: (intent) => changeItemType(false)),
                  UpButtonIntent: CallbackAction<UpButtonIntent>(
                      onInvoke: (intent) => changeItem(false)),
                  DownButtonIntent: CallbackAction<DownButtonIntent>(
                      onInvoke: (intent) => changeItem(true)),
                },
                child: Focus(
                  focusNode: focus,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: MediaQuery.of(context).size.width / 2,
                          color: const Color.fromARGB(255, 247, 16, 0),
                          child: currentItem,
                        ),
                        Container(
                          height: constraints.maxHeight,
                          width: MediaQuery.of(context).size.width / 2,
                          color: const Color.fromARGB(255, 0, 255, 8),
                          child: currentItem,
                        )
                      ],
                    );
                  }),
                ))));
  }
}
