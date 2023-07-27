import 'dart:math';

import 'package:eyevision/utils/chart-item-logmar.dart';
import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../utils/chartItem-snellan.dart';
import '../utils/helper.dart';
import 'login.dart';

class LogmarChartScreen extends StatefulWidget {
  LogmarChartScreen({super.key, required this.image});
  String image;
  final ScrollController controller = ScrollController();
  @override
  State<LogmarChartScreen> createState() => _LogmarChartState();
  List<ChartItemLogmar> chartItemsList = [];
}

class _LogmarChartState extends State<LogmarChartScreen> {
  int itemIndex = 0;
  late ChartItemLogmar currentItem;
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  bool initialState = true;
  int currentHorizontalPos = 0;
  int currentVerticalPos = 0;
  String distance = '5';
  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController();
  List<String> items = ['C', 'E', 'Letters', 'Numbers'];
  changeItem(bool next) {
    if (next) {
      if (itemIndex == items.length - 1) return;
      itemIndex++;
      widget.image = items[itemIndex];
    } else {
      itemIndex--;
      if (itemIndex < 0) {
        itemIndex = 0;
      }
      widget.image = items[itemIndex];
    }
    loadImage();
    setState(() {
      initialState = true;
    });
  }

  @override
  initState() {
    checkMode();
    super.initState();
  }

  checkMode() async {
    distance = await Helper.getData('distance') ?? '';
    setState(() {});
  }

  setImage(String image) {
    if (initialState) {
      List<ChartItemLogmar> chartItemsList = [
        ChartItemLogmar(
            textLeft: '6/60',
            textRight: '1.0',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 279.139392,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/48',
            textRight: '0.9',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 279.139392,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/38',
            textRight: '0.8',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 167.5479733848944,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/30',
            textRight: '0.7',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 167.5479733848944,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/24',
            textRight: '0.6',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 111.59206787241891,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/19',
            textRight: '0.5',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 83.7739866924472,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/15',
            textRight: '0.4',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 83.7739866924472,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/12',
            textRight: '0.3',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 55.955905512475496,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/9.5',
            textRight: '0.2',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 27.818078130616847,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/7.5',
            textRight: '0.1',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 27.818078130616847,
            language: widget.image),
        ChartItemLogmar(
            textLeft: '6/6',
            textRight: '0',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: 27.818078130616847,
            language: widget.image),
      ];
      initialState = false;
      return chartItemsList;
    } else
      return widget.chartItemsList;
  }

  final String _chars = 'CDHKNORSVZ';
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

  loadImage() {
    String itemImage = widget.image;
    if (widget.image == 'Letters') {
      itemImage = getRandomString(1);
      enableRotation = false;
    } else if (widget.image == 'Numbers') {
      itemImage = getRandomNumber(1);
      enableRotation = false;
    } else if (widget.image == 'Tamil') {
      itemImage = getRandomTamil(1);
      enableRotation = false;
    } else if (widget.image == 'Telugu') {
      itemImage = getRandomTelugu(1);
      enableRotation = false;
    } else if (widget.image == 'Hindi') {
      itemImage = getRandomHindi(1);
      enableRotation = false;
    } else {
      enableRotation = true;
    }
    widget.chartItemsList = setImage(itemImage);
    currentItem = widget.chartItemsList[itemIndex];
    widget.chartItemsList.forEach((element) {
      print(element.image);
    });
  }

  scrollHorizontal(bool right) {
    if (right) {
      scrollController.animateTo(currentHorizontalPos + 100,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
      currentHorizontalPos += 100;
    } else {
      scrollController.animateTo(currentHorizontalPos - 100,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
      if (currentHorizontalPos < 0) {
        currentHorizontalPos = 0;
      } else {
        currentHorizontalPos -= 100;
      }
    }
  }

  scrollVertical(bool up) {
    if (up) {
      verticalScrollController.animateTo(currentVerticalPos + 50,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
 
        currentVerticalPos += 50;
      
    } else {
      verticalScrollController.animateTo(currentVerticalPos - 50,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
      if (currentVerticalPos < 0) {
        currentVerticalPos = 0;
      } else {
        currentVerticalPos -= 50;
      }
    }
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
                    onInvoke: (intent) => {scrollHorizontal(true)}),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => {scrollHorizontal(false)}),
                UpButtonIntent: CallbackAction<UpButtonIntent>(
                    onInvoke: (intent) => {scrollVertical(false)}),
                DownButtonIntent: CallbackAction<DownButtonIntent>(
                    onInvoke: (intent) => {scrollVertical(true)}),
              },
              child: Focus(
                  focusNode: focus,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: verticalScrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        child: Container(
                          width: calculatePixel(int.parse(distance), widget.chartItemsList[0].textLeft)*13.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                child: widget.chartItemsList[0],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: widget.chartItemsList[1],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: widget.chartItemsList[2],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[3],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[4],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[5],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[6],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[7],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[8],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[9],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: widget.chartItemsList[10],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            )));
  }

  double calculatePixel(int feat, String type) {
    if (type == "6/60") {
      return feat / 4 * MM_60 * 3.7795275591 * 0.846;
    } else if (type == "6/48") {
      return feat / 4 * MM_48 * 3.7795275591 * 0.846;
    } else if (type == "6/38") {
      return feat / 4 * MM_38 * 3.7795275591 * 0.846;
    } else if (type == "6/36") {
      return feat / 4 * MM_36 * 3.7795275591 * 0.846;
    } else if (type == "6/30") {
      return feat / 4 * MM_30 * 3.7795275591 * 0.846;
    } else if (type == "6/24") {
      return feat / 4 * MM_24 * 3.7795275591 * 0.846;
    } else if (type == "6/19") {
      return feat / 4 * MM_19 * 3.7795275591 * 0.846;
    } else if (type == "6/18") {
      return feat / 4 * MM_18 * 3.7795275591 * 0.846;
    } else if (type == "6/15") {
      return feat / 4 * MM_15 * 3.7795275591 * 0.846;
    } else if (type == "6/12") {
      return feat / 4 * MM_12 * 3.7795275591 * 0.846;
    } else if (type == "6/9.5") {
      return feat / 4 * MM_9_5 * 3.7795275591 * 0.846;
    } else if (type == "6/9") {
      return feat / 4 * MM_9 * 3.7795275591 * 0.846;
    } else if (type == "6/7.5") {
      return feat / 4 * MM_7_5 * 3.7795275591 * 0.846;
    } else if (type == "6/6") {
      return feat / 4 * MM_6 * 3.7795275591 * 0.846;
    }
    return 0;
  }
}
