import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem-single.dart';
import '../utils/chartItem.dart';
import '../utils/helper.dart';
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
  String lang1 = 'Hindi';
  String lang2 = 'Tamil';
  String lang3 = 'Telugu';
  List<String> items = [];
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

  getLanguages() async {
    await Helper.getData('lang1').then((value) => {
          (value != '') ? (lang1 = value) : lang1 = 'Hindi',
        });
    await Helper.getData('lang2')
        .then((value) => {(value != '') ? (lang2 = value) : lang2 = 'Tamil'});
    await Helper.getData('lang3')
        .then((value) => {(value != '') ? (lang3 = value) : lang3 = 'Telugu'});
    items = ['C', 'E', 'Letters', 'Numbers', lang1, lang2, lang3];
    setState(() {});
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
    getLanguages();

    super.initState();
  }

  setImage(String image1) {
    // if (initialState) {
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
    // } else {
    //   return widget.chartItemsList;
    // }
  }

  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _numbers = '2345679';
  final String _tamil = 'அஆஇஈஉஊஎஏஐஒஓஔகஙசஞடணதநனபமயரறலளழவ';
  final String _telugu = 'అఆఇఈఉఊఋఌఎఏఐఒఓఔకఖగఘఙచఛజఝఞటఠడఢణతథదధనపఫబభమయరఱలళఴవశషసహ';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final String _arabic = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _asamese = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _bengali = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _gujrati = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _kannad = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _malyalam = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _nepali = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _oriya = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _punjabi = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _urdu = 'qwertyuiopasdfghjklzxcvbnm';
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
  String getRandomArabic(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _arabic.codeUnitAt(_rnd.nextInt(_arabic.length))));
  String getRandomAssamese(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _asamese.codeUnitAt(_rnd.nextInt(_asamese.length))));
  String getRandomBengali(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _bengali.codeUnitAt(_rnd.nextInt(_bengali.length))));
  String getRandomGujrati(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _gujrati.codeUnitAt(_rnd.nextInt(_gujrati.length))));
  String getRandomKannad(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _kannad.codeUnitAt(_rnd.nextInt(_kannad.length))));
  String getRandomMalayalam(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _malyalam.codeUnitAt(_rnd.nextInt(_malyalam.length))));
  String getRandomNepali(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _nepali.codeUnitAt(_rnd.nextInt(_nepali.length))));
  String getRandomOriya(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _oriya.codeUnitAt(_rnd.nextInt(_oriya.length))));
  String getRandomPunjabi(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _punjabi.codeUnitAt(_rnd.nextInt(_punjabi.length))));
  String getRandomUrdu(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _urdu.codeUnitAt(_rnd.nextInt(_urdu.length))));

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
    } else if (image == 'Assamese') {
      itemImage = getRandomAssamese(1);
      enableRotation = false;
    } else if (image == 'Arabic') {
      itemImage = getRandomArabic(1);
      enableRotation = false;
    } else if (image == 'Bengali') {
      itemImage = getRandomBengali(1);
      enableRotation = false;
    } else if (image == 'Kannada') {
      itemImage = getRandomKannad(1);
      enableRotation = false;
    } else if (image == 'Malayalam') {
      itemImage = getRandomMalayalam(1);
      enableRotation = false;
    } else if (image == 'Oriya') {
      itemImage = getRandomOriya(1);
      enableRotation = false;
    } else if (image == 'Punjabi') {
      itemImage = getRandomPunjabi(1);
      enableRotation = false;
    } else if (image == 'Urdu') {
      itemImage = getRandomUrdu(1);
      enableRotation = false;
    } else {
      enableRotation = true;
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
    } else if (image == 'Assamese') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomAssamese(1));
      }
    } else if (image == 'Arabic') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomArabic(1));
      }
    } else if (image == 'Bengali') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomBengali(1));
      }
    } else if (image == 'Malayalam') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomMalayalam(1));
      }
    } else if (image == 'Kannada') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomKannad(1));
      }
    } else if (image == 'Punjabi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomPunjabi(1));
      }
    } else if (image == 'Oriya') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomOriya(1));
      }
    } else if (image == 'Urdu') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomUrdu(1));
      }
    } else if (image == 'Tamil') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomTamil(1));
      }
    } else if (image == 'Telugu') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomTelugu(1));
      }
    } else {
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
    } else if (image == 'C' || image == 'E') {
      enableRotation = true;
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
                      onInvoke: (intent) => changeItem(true)),
                  DownButtonIntent: CallbackAction<DownButtonIntent>(
                      onInvoke: (intent) => changeItem(false)),
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
                          color: const Color.fromARGB(255, 248, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(currentItem.textLeft),
                              currentItem,
                              const Text(''),
                            ],
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight,
                          width: MediaQuery.of(context).size.width / 2,
                          color: const Color.fromARGB(255, 0, 255, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(''),
                              currentItem,
                              Text(currentItem.textRight),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ))));
  }
}
