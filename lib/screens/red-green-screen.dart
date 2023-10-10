import 'dart:math';

import 'package:eyevision/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

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
  bool inverse = false;
  String mode = 'Normal';
  String distance = '5';
  double constant = 0;
  String cons60 = '0.0';
  String cons36 = '0.0';
  String cons24 = '0.0';
  String cons18 = '0.0';
  String cons12 = '0.0';
  String cons9 = '0.0';
  String cons6 = '0.0';
  Future<bool>? _dataLoaded;
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
    _dataLoaded = checkMode();
    checkInvert();
    setState(() {});
    super.initState();
  }

  checkInvert() async {
    await Helper.getData('inversion').then((value) => {
          if (value == "invert") {inverse = true},
          print(value)
        });
  }

  Future<bool> checkMode() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '5';
    cons60 = await Helper.getData('constant$distance' '6/60') ?? '0.0';
    cons36 = await Helper.getData('constant$distance' '6/36') ?? '0.0';
    cons24 = await Helper.getData('constant$distance' '6/24') ?? '0.0';
    cons24 = await Helper.getData('constant$distance' '6/24') ?? '0.0';
    cons18 = await Helper.getData('constant$distance' '6/18') ?? '0.0';
    cons9 = await Helper.getData('constant$distance' '6/9') ?? '0.0';
    cons6 = await Helper.getData('constant$distance' '6/6') ?? '0.0';
    return true;
    // setState(() {});
  }

  double calculatePixel(int feat, String type) {
    double calculatedSize = 0;
    if (type == "6/60") {
      calculatedSize =
          feat / 4 * MM_60 * 3.7795275591 * 0.846 + double.parse(cons60);
    } else if (type == "6/36") {
      calculatedSize =
          feat / 4 * MM_36 * 3.7795275591 * 0.846 + double.parse(cons36);
    } else if (type == "6/24") {
      calculatedSize =
          feat / 4 * MM_24 * 3.7795275591 * 0.846 + double.parse(cons24);
    } else if (type == "6/18") {
      calculatedSize =
          feat / 4 * MM_18 * 3.7795275591 * 0.846 + double.parse(cons18);
    } else if (type == "6/12") {
      calculatedSize =
          feat / 4 * MM_12 * 3.7795275591 * 0.846 + double.parse(cons12);
    } else if (type == "6/9") {
      calculatedSize =
          feat / 4 * MM_9 * 3.7795275591 * 0.846 + double.parse(cons9);
    } else if (type == "6/6") {
      calculatedSize =
          feat / 4 * MM_6 * 3.7795275591 * 0.846 + double.parse(cons6);
    }
    double finalSize = getConstant('Letters', calculatedSize);
    return finalSize;
  }

  setImage(String image1) {
    // if (initialState) {
      List<ChartItemSingle> chartItemsList = [
        ChartItemSingle(
            textLeft: '6/60',
            textRight: '20/200',
            rotations: enableRotation ? [0] : [-1],
            image: generateItems(1),
            imageSize: calculatePixel(int.parse(distance), '6/60'),
            language: image),
        ChartItemSingle(
            textLeft: '6/36',
            textRight: '20/120',
            rotations: enableRotation ? [0, 0] : [-1, -1],
            image: generateItems(2),
            imageSize: calculatePixel(int.parse(distance), '6/36'),
            language: image),
        ChartItemSingle(
            textLeft: '6/24',
            textRight: '20/80',
            rotations: enableRotation ? [270, 270, 0] : [-1, -1, -1],
            image: generateItems(3),
            imageSize: calculatePixel(int.parse(distance), '6/24'),
            language: image),
        ChartItemSingle(
            textLeft: '6/18',
            textRight: '20/60',
            rotations: enableRotation ? [0, 270, 90, 0] : [-1, -1, -1, -1],
            image: generateItems(4),
            imageSize: calculatePixel(int.parse(distance), '6/18'),
            language: image),
        ChartItemSingle(
            textLeft: '6/12',
            textRight: '20/40',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: generateItems(5),
            imageSize: calculatePixel(int.parse(distance), '6/12'),
            language: image1),
        ChartItemSingle(
            textLeft: '6/6',
            textRight: '20/20',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            image: generateItems(6),
            imageSize: calculatePixel(int.parse(distance), '6/6'),
            language: image1),
      ];
      initialState = false;
      return chartItemsList;
    // } else {
    //   return widget.chartItemsList;
    // }
  }

  final String _chars = 'NRKDZHS';
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

  getWidget(){
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

  waitForWidget() {
    return FutureBuilder<bool>(
        future: _dataLoaded,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return getWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focus);
    return inverse ? InvertColors(child: waitForWidget()) : waitForWidget();
  }
}
