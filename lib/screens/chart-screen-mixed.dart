import 'dart:math';

import 'package:eyevision/utils/chart-item-mixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

import '../utils/chartItem.dart';
import '../utils/helper.dart';
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
  late ChartItemMixed currentItem = ChartItemMixed(
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
  final String _tamil = 'அஆஇஈஉஊஎஏஐஒஓஔகஙசஞடணதநனபமயரறலளழவ';
  final String _telugu = 'అఆఇఈఉఊఋఌఎఏఐఒఓఔకఖగఘఙచఛజఝఞటఠడఢణతథదధనపఫబభమయరఱలళఴవశషసహ';
  final String _allen = 'EIADFGHCB';
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
  bool initialState = true;
  bool chartMode = true;
  bool inverse = false;
  @override
  void initState() {
    checkInvert();
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
  String getRandomTamil(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _tamil.codeUnitAt(_rnd.nextInt(_tamil.length))));
  String getRandomTelugu(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _telugu.codeUnitAt(_rnd.nextInt(_telugu.length))));

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

  checkInvert() async {
    await Helper.getData('inversion').then((value) => {
          if (value == "invert") {inverse = true},
          print(value)
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
    } else if (widget.type == 'Allen') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomSymbol(1));
      }
    } else if (widget.type == 'Hindi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomHindi(1));
      }
    } else if (widget.type == 'Arabic') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomArabic(1));
      }
    } else if (widget.type == 'Assamese') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomAssamese(1));
      }
    } else if (widget.type == 'Bengali') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomBengali(1));
      }
    } else if (widget.type == 'Gujrati') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomGujrati(1));
      }
    } else if (widget.type == 'Kannada') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomKannad(1));
      }
    } else if (widget.type == 'Malayalam') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomMalayalam(1));
      }
    } else if (widget.type == 'Nepali') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomNepali(1));
      }
    } else if (widget.type == 'Punjabi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomPunjabi(1));
      }
    } else if (widget.type == 'Oriya') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomOriya(1));
      }
    } else if (widget.type == 'Urdu') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomUrdu(1));
      }
    } else if (widget.type == 'Tamil') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomTamil(1));
      }
    } else if (widget.type == 'Telugu') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomTelugu(1));
      }
    }
    return images;
  }

  setImage() {
    List<ChartItemMixed> chartItemsList = [
      ChartItemMixed(
          textLeft: '6/60',
          textRight: '20/200',
          images: chartMode ? generateItems(1) : generateItems(1),
          imageSize: 279.139392,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/36',
          textRight: '20/120',
          images: chartMode ? generateItems(2) : generateItems(1),
          imageSize: 167.5479733848944,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/24',
          textRight: '20/80',
          images: chartMode ? generateItems(3) : generateItems(1),
          imageSize: 111.59206787241891,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/18',
          textRight: '20/60',
          images: chartMode ? generateItems(4) : generateItems(1),
          imageSize: 83.7739866924472,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/12',
          textRight: '20/40',
          images: chartMode ? generateItems(5) : generateItems(1),
          imageSize: 55.955905512475496,
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/6',
          textRight: '20/20',
          images: chartMode ? generateItems(6) : generateItems(1),
          imageSize: 27.818078130616847,
          type: widget.type),
    ];
    return chartItemsList;
  }

  loadImage() {
    widget.chartItemsList = setImage();
    currentItem = widget.chartItemsList[itemIndex];
  }

  getWidget(){
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
                // RightButtonIntent: CallbackAction<RightButtonIntent>(
                //     onInvoke: (intent) => changeItem(true)),
                // LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                //     onInvoke: (intent) => changeItem(false)),
                EnterButtonIntent: CallbackAction<EnterButtonIntent>(
                    onInvoke: (intent) => switchMode()),
              },
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }

  @override
  Widget build(BuildContext context) {
    // loadImage();
    FocusScope.of(context).requestFocus(focus);
    return inverse ? InvertColors(child: getWidget()) : getWidget();
  }
}
