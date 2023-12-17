import 'dart:math';

import 'package:eyevision/screens/chart-screen.dart';
import 'package:eyevision/utils/chart-item-mixed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

import '../constants/constants.dart';
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
  final String _chars = 'NRKDZHS';
  final String _numbers = '2345679';
  final String _hindi = 'nmpPTgq';
  final String _tamil = 'trlfagk';
  final String _telugu = 'vYLEndg';
  final String _allen = 'EIADFGHCB';
  final String _arabic = 'axhPkVX';
  final String _asamese = 'PhAWonj';
  final String _bengali = 'AicWofk';
  final String _gujrati = 'Jmhvldf';
  final String _kannad = 'MLCtJYD';
  final String _malyalam = 'pmaiUbk';
  final String _nepali = '8;nxoeu';
  final String _oriya = 'WnOMbeN';
  final String _punjabi = 'NHlfZoE';
  final String _urdu = 'xmtqaek';
  final Random _rnd = Random();
  bool initialState = true;
  bool chartMode = true;
  bool inverse = false;
  String lang1 = 'Hindi';
  String lang2 = 'Tamil';
  String lang3 = 'Telugu';
  double constant = 0;
  String mode = 'Normal';
  String distance = '5';
  String cons60 = '0.0';
  String cons36 = '0.0';
  String cons24 = '0.0';
  String cons18 = '0.0';
  String cons12 = '0.0';
  String cons9 = '0.0';
  String cons6 = '0.0';
  String cons4 = '0.0';
  Future<bool>? _dataLoaded;
  List<String> usedItems = [];
  @override
  void initState() {
    _dataLoaded = checkMode();
    
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
    usedItems = [];
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
    setState(() {
      loadImage();
    });
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
    getLanguages();
    setState(() {
      initialState = true;
    });
  }

  Future<bool> checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '5';
    cons60 = await Helper.getData('constant10' '6/60') ?? '0.0';
    cons36 = await Helper.getData('constant10' '6/36') ?? '0.0';
    cons24 = await Helper.getData('constant10' '6/24') ?? '0.0';
    cons18 = await Helper.getData('constant10' '6/18') ?? '0.0';
    cons12 = await Helper.getData('constant10' '6/12') ?? '0.0';
    cons9 = await Helper.getData('constant10' '6/9') ?? '0.0';
    cons6 = await Helper.getData('constant10' '6/6') ?? '0.0';
    cons4 = await Helper.getData('constant10' '6/4') ?? '0.0';
    await getLanguages();
    await checkInvert();
    loadImage();
    return true;
  }

  getLanguages() async {
    Helper.setData('languageChanged', 'false');
    await Helper.containes('lang1').then((value) => {
          if (!value) {Helper.setData('lang1', 'Hindi')}
        });
    await Helper.containes('lang2').then((value) => {
          if (!value) {Helper.setData('lang2', 'Tamil')}
        });
    await Helper.containes('lang3').then((value) => {
          if (!value) {Helper.setData('lang3', 'Telugu')}
        });
    await Helper.getData('lang1').then((value) => {
          (value != '') ? (lang1 = value) : lang1 = 'Hindi',
        });
    await Helper.getData('lang2')
        .then((value) => {(value != '') ? (lang2 = value) : lang2 = 'Tamil'});
    await Helper.getData('lang3')
        .then((value) => {(value != '') ? (lang3 = value) : lang3 = 'Telugu'});
    // setState(() {});
  }

  switchChart(bool right) {
    if (right) {
      if (widget.type == 'Alphabets') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: 'Numbers')));
      } else if (widget.type == 'Numbers') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: lang1)));
      } else if (widget.type == lang1) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: lang2)));
      } else if (widget.type == lang2) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: lang3)));
      }
    } else {
      if (widget.type == 'Numbers') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: 'Alphabets')));
      } else if (widget.type == lang1) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: 'Numbers')));
      } else if (widget.type == lang2) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: lang1)));
      } else if (widget.type == lang3) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: lang2)));
      } else if (widget.type == 'Alphabets') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChartScreen(image: 'E')));
      }
    }
  }

  generateItems(int count) {
    List<String> images = [];
    if (widget.type == 'Alphabets') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomString(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Numbers') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomNumber(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Allen') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomSymbol(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Hindi') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomHindi(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Arabic') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomArabic(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Assamese') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomAssamese(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Bengali') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomBengali(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Gujrati') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomGujrati(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Kannada') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomKannad(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Malayalam') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomMalayalam(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Nepali') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomNepali(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Punjabi') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomPunjabi(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Oriya') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomOriya(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Urdu') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomOriya(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Tamil') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomTamil(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    } else if (widget.type == 'Telugu') {
      for (int i = 0; i < count; i++) {
        String randomString = getRandomTelugu(1);
        if (!usedItems.contains(randomString)) {
          images.add(randomString);
          usedItems.add(randomString);
        } else {
          i--;
        }
      }
    }
    usedItems = [];
    return images;
  }

  double calculatePixel(int feat, String type) {
    double calculatedSize = 0;
    if (type == "6/60") {
      calculatedSize = feat / 4 * MM_60 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons60));
    } else if (type == "6/36") {
      calculatedSize = feat / 4 * MM_36 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons36));
    } else if (type == "6/24") {
      calculatedSize = feat / 4 * MM_24 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons24));
    } else if (type == "6/18") {
      calculatedSize = feat / 4 * MM_18 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons18));
    } else if (type == "6/12") {
      calculatedSize = feat / 4 * MM_12 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons12));
    } else if (type == "6/9") {
      calculatedSize = feat / 4 * MM_9 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons9));
    } else if (type == "6/6") {
      calculatedSize = feat / 4 * MM_6 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons6));
    } else if (type == "6/4") {
      calculatedSize = feat / 4 * MM_4 * 3.7795275591 * 0.846 +
          convertConstant(distance, double.parse(cons4));
    }
    double finalSize =
        getConstantWithDistance(widget.type, calculatedSize, type);
    print('-----------------' +
        type +
        ': ' +
        finalSize.toString() +
        '-----------------');
    return finalSize;
  }

  setImage() {
    List<ChartItemMixed> chartItemsList = [
      ChartItemMixed(
          textLeft: '6/60',
          textRight: '20/200',
          images: chartMode ? generateItems(1) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/60'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/36',
          textRight: '20/120',
          images: chartMode ? generateItems(2) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/36'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/24',
          textRight: '20/80',
          images: chartMode ? generateItems(3) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/24'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/18',
          textRight: '20/60',
          images: chartMode ? generateItems(4) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/18'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/12',
          textRight: '20/40',
          images: chartMode ? generateItems(5) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/12'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/9',
          textRight: '20/30',
          images: chartMode ? generateItems(6) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/9'),
          type: widget.type),
      ChartItemMixed(
          textLeft: '6/6',
          textRight: '20/20',
          images: chartMode ? generateItems(7) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/6'),
          type: widget.type),
          ChartItemMixed(
          textLeft: '6/4',
          textRight: '20/12',
          images: chartMode ? generateItems(7) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/4'),
          type: widget.type),
    ];
    return chartItemsList;
  }

  loadImage() {
    widget.chartItemsList = setImage();
    currentItem = widget.chartItemsList[itemIndex];
  }

  waitForWidget() {
    return FutureBuilder<bool>(
        future: _dataLoaded,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            // loadImage();
            return getWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getWidget() {
    // loadImage();
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
                    onInvoke: (intent) => switchChart(true)),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => switchChart(false)),
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
    return inverse ? InvertColors(child: waitForWidget()) : waitForWidget();
  }
}
