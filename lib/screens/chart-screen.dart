import 'dart:math';

import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/screens/chart-screen-mixed.dart';
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
  late ChartItem currentItem = ChartItem(
    textLeft: '6/60',
    textRight: '20/200',
    rotations: enableRotation
        ? chartMode
            ? 1
            : 1
        : -1,
    image: 'C',
    imageSize: calculatePixel(int.parse(distance), '6/60'),
    language: 'C',
  );
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  bool initialState = true;
  bool chartMode = true;
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
  String cons4 = '0.0';
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

  switchMode() {
    chartMode = !chartMode;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: chartMode ? const Text('Multiple') : const Text('Single'),
      duration: const Duration(milliseconds: 500),
    ));
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
    return true;
    // setState(() {});
  }
  // Future<bool> checkMode() async {
  //   mode = await Helper.getData('mode') ?? '';
  //   distance = await Helper.getData('distance') ?? '5';
  //   cons60 = await Helper.getData('constant$distance' '6/60') ?? '0.0';
  //   cons36 = await Helper.getData('constant$distance' '6/36') ?? '0.0';
  //   cons24 = await Helper.getData('constant$distance' '6/24') ?? '0.0';
  //   cons24 = await Helper.getData('constant$distance' '6/24') ?? '0.0';
  //   cons18 = await Helper.getData('constant$distance' '6/18') ?? '0.0';
  //   cons9 = await Helper.getData('constant$distance' '6/9') ?? '0.0';
  //   cons6 = await Helper.getData('constant$distance' '6/6') ?? '0.0';
  //   return true;
  //   // setState(() {});
  // }

  @override
  initState() {
    _dataLoaded = checkMode();
    checkInvert();
    setState(() {});
    super.initState();
  }

  switchChart(bool right) {
    if (right) {
      if (widget.image == 'C') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChartScreen(image: 'E')));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChartScreenMixed(type: 'Alphabets')));
      }
    } else {
      if (widget.image == 'E') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ChartScreen(image: 'C')));
      }
    }
  }

  double calculatePixel(int feat, String type) {
    double calculatedSize = 0;
    if (type == "6/60") {
      calculatedSize =
          feat / 4 * MM_60 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons60)) ;
    } else if (type == "6/36") {
      calculatedSize =
          feat / 4 * MM_36 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons36));
    } else if (type == "6/24") {
      calculatedSize =
          feat / 4 * MM_24 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons24));
    } else if (type == "6/18") {
      calculatedSize =
          feat / 4 * MM_18 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons18));
    } else if (type == "6/12") {
      calculatedSize =
          feat / 4 * MM_12 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons12));
    } else if (type == "6/9") {
      calculatedSize =
          feat / 4 * MM_9 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons9));
    } else if (type == "6/6") {
      calculatedSize =
          feat / 4 * MM_6 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons6));
    } else if (type == "6/4") {
      calculatedSize =
          feat / 4 * MM_4 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons4));
    }
    double finalSize = getConstant(widget.image, calculatedSize);
    return finalSize;
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
            imageSize: calculatePixel(int.parse(distance), '6/60'),
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
            imageSize: calculatePixel(int.parse(distance), '6/36'),
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
            imageSize: calculatePixel(int.parse(distance), '6/24'),
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
            imageSize: calculatePixel(int.parse(distance), '6/18'),
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
            imageSize: calculatePixel(int.parse(distance), '6/12'),
            language: widget.image),
        ChartItem(
            textLeft: '6/9',
            textRight: '20/30',
            rotations: enableRotation
                ? chartMode
                    ? 6
                    : 1
                : -1,
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/9'),
            language: widget.image),
        ChartItem(
            textLeft: '6/6',
            textRight: '20/20',
            rotations: enableRotation
                ? chartMode
                    ? 7
                    : 1
                : -1,
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/6'),
            language: widget.image),
        ChartItem(
            textLeft: '6/4',
            textRight: '20/12',
            rotations: enableRotation
                ? chartMode
                    ? 8
                    : 1
                : -1,
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/4'),
            language: widget.image)
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

  Widget getWidget() {
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
    FocusScope.of(context).requestFocus(focus);
    return inverse ? InvertColors(child: waitForWidget()) : waitForWidget();
  }
}
