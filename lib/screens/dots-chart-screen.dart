import 'dart:math';

import 'package:eyevision/utils/chart-item-mixed.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

import '../constants/constants.dart';
import '../utils/chartItem.dart';
import '../utils/dots-item.dart';
import 'login.dart';

class DotsChartScreen extends StatefulWidget {
  DotsChartScreen({super.key, required this.type});
  final String type;
  List<DotsItem> chartItemsList = [];
  @override
  State<DotsChartScreen> createState() => _ChartScreenMixedState();
}

class _ChartScreenMixedState extends State<DotsChartScreen> {
  int itemIndex = 0;
  late DotsItem currentItem;
  FocusNode focus = FocusNode();
  final String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _numbers = '1234567890';
  final String _hindi =
      'एइईउऊऐओऔअंऋॠकखघएनचछजझटठधऔरथदधएनपफभएमवाईरएलवीशषसहक्षज्ञ';
  final String _allen = 'EIADFGHCB';
  final String _dots = 'EADFCB';
  final Random _rnd = Random();
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
  Future<bool>? _dataLoaded;
  @override
  void initState() {
    _dataLoaded = checkMode();
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
  String getRandomDots(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _dots.codeUnitAt(_rnd.nextInt(_dots.length))));

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
    return true;
    // setState(() {});
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
    } else if (widget.type == 'Hindi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomHindi(1));
      }
    } else if (widget.type == 'Allen') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomSymbol(1));
      }
    } else if (widget.type == 'Dots') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomDots(1));
      }
    }
    return images;
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
    }
    double finalSize = getConstant(widget.type, calculatedSize);
    return finalSize;
  }

  setImage() {
    List<DotsItem> chartItemsList = [
      DotsItem(
          textLeft: '6/60',
          textRight: '20/200',
          images: chartMode ? generateItems(1) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/60'),
          type: widget.type),
      DotsItem(
          textLeft: '6/36',
          textRight: '20/120',
          images: chartMode ? generateItems(2) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/36'),
          type: widget.type),
      DotsItem(
          textLeft: '6/24',
          textRight: '20/80',
          images: chartMode ? generateItems(3) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/24'),
          type: widget.type),
      DotsItem(
          textLeft: '6/18',
          textRight: '20/60',
          images: chartMode ? generateItems(4) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/18'),
          type: widget.type),
      DotsItem(
          textLeft: '6/12',
          textRight: '20/40',
          images: chartMode ? generateItems(5) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/12'),
          type: widget.type),
      DotsItem(
          textLeft: '6/6',
          textRight: '20/20',
          images: chartMode ? generateItems(6) : generateItems(1),
          imageSize: calculatePixel(int.parse(distance), '6/6'),
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
            return getWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getWidget() {
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
    return inverse ? InvertColors(child: waitForWidget()) : waitForWidget();
  }
}
