import 'dart:math';

import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

import '../utils/helper.dart';
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
  bool initialState = true;
  bool chartMode = true;
  bool inverse = false;
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

  switchMode() {
    chartMode = !chartMode;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: chartMode ? const Text('Multiple') : const Text('Single'),
      duration: const Duration(milliseconds: 500),
    ));
    loadImage();
    setState(() {
      initialState = true;
    });
  }

  checkInvert() async {
    await Helper.getData('inversion').then((value) => {
          if (value == "invert") {inverse = true},
          print(value)
        });
  }

  @override
  initState() {
    checkInvert();
    super.initState();
  }

  setImage(String image) {
    if (initialState) {
      List<ChartItem> chartItemsList = [
        ChartItem(
            textLeft: '6/60',
            textRight: '20/200',
            rotations: enableRotation
                ? chartMode
                    ? 1
                    : 1
                : -1,
            image: image,
            imageSize: 279.139392,
            language: widget.image),
        ChartItem(
            textLeft: '6/36',
            textRight: '20/120',
            rotations: enableRotation
                ? chartMode
                    ? 2
                    : 1
                : -1,
            image: image,
            imageSize: 167.5479733848944,
            language: widget.image),
        ChartItem(
            textLeft: '6/24',
            textRight: '20/80',
            rotations: enableRotation
                ? chartMode
                    ? 3
                    : 1
                : -1,
            image: image,
            imageSize: 111.59206787241891,
            language: widget.image),
        ChartItem(
            textLeft: '6/18',
            textRight: '20/60',
            rotations: enableRotation
                ? chartMode
                    ? 4
                    : 1
                : -1,
            image: image,
            imageSize: 83.7739866924472,
            language: widget.image),
        ChartItem(
            textLeft: '6/12',
            textRight: '20/40',
            rotations: enableRotation
                ? chartMode
                    ? 5
                    : 1
                : -1,
            image: image,
            imageSize: 55.955905512475496,
            language: widget.image),
        ChartItem(
            textLeft: '6/6',
            textRight: '20/20',
            rotations: enableRotation
                ? chartMode
                    ? 6
                    : 1
                : -1,
            image: image,
            imageSize: 27.818078130616847,
            language: widget.image),
      ];
      initialState = false;
      return chartItemsList;
    } else
      return widget.chartItemsList;
  }

  final String _chars = 'AaBCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZzb';
  final String _numbers = '1234567890';
  final String _tamil = 'அஆஇஈஉஊஎஏஐஒஓஔகஙசஞடணதநனபமயரறலளழவ';
  final String _telugu = 'అఆఇఈఉఊఋఌఎఏఐఒఓఔకఖగఘఙచఛజఝఞటఠడఢణతథదధనపఫబభమయరఱలళఴవశషసహ';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final String _allen = 'EIADFGHJCB';
  final String _arabic = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _asamese = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _bengali = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _gujrati = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _kannad = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _malyalam = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _nepali = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _oriya = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _punjabi = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  final String _urdu = 'QWERTYUIOPASDFGHJKLZXCVBNM';

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
  String getRandomSymbol(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _allen.codeUnitAt(_rnd.nextInt(_allen.length))));
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
    } else if (widget.image == 'Allen') {
      itemImage = getRandomSymbol(1);
      enableRotation = false;
    }
    widget.chartItemsList = setImage(itemImage);
    currentItem = widget.chartItemsList[itemIndex];
    widget.chartItemsList.forEach((element) {
      print(element.image);
    });
  }

  Widget getWidget() {
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
                EnterButtonIntent: CallbackAction<EnterButtonIntent>(
                    onInvoke: (intent) => switchMode()),
              },
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }

  @override
  Widget build(BuildContext context) {
    loadImage();
    FocusScope.of(context).requestFocus(focus);
    return inverse ? InvertColors(child: getWidget()) : getWidget();
  }
}
