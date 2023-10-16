import 'dart:math';

import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invert_colors/invert_colors.dart';

import '../constants/constants.dart';
import '../utils/chartItem-snellan.dart';
import '../utils/helper.dart';
import 'login.dart';

class SnellanChartScreen extends StatefulWidget {
  SnellanChartScreen({super.key, required this.image});
  String image;
  @override
  State<SnellanChartScreen> createState() => _SnellanChartScreen();
  List<ChartItemSnellan> chartItemsList = [];
}

class _SnellanChartScreen extends State<SnellanChartScreen> {
  int itemIndex = 0;
  late ChartItemSnellan currentItem;
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  bool initialState = true;
  List<String> items = ['Letters', 'Numbers'];
  String distance = '5';
  String mode = 'Normal';
  int currentHorizontalPos = 0;
  int currentVerticalPos = 0;
  double constant = 0;
  String cons60 = '0.0';
  String cons48 = '0.0';
  String cons38 = '0.0';
  String cons36 = '0.0';
  String cons30 = '0.0';
  String cons24 = '0.0';
  String cons19 = '0.0';
  String cons18 = '0.0';
  String cons15 = '0.0';
  String cons12 = '0.0';
  String cons9_5 = '0.0';
  String cons9 = '0.0';
  String cons7_5 = '0.0';
  String cons6 = '0.0';
  String cons5 = '0.0';
  Future<bool>? _dataLoaded;
  bool inverse = false;
  final ScrollController scrollController = ScrollController();
  final ScrollController verticalScrollController = ScrollController();
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
    _dataLoaded = checkMode1();
    checkMode();
    checkInvert();
    super.initState();
  }

  checkInvert() async {
    await Helper.getData('inversion').then((value) => {
          if (value == "invert") {inverse = true},
          print(value)
        });
  }

  checkMode() async {
    distance = await Helper.getData('distance') ?? '';
    setState(() {});
  }

  Future<bool> checkMode1() async {
    mode = await Helper.getData('mode') ?? '';
    distance = await Helper.getData('distance') ?? '5';
    cons60 = await Helper.getData('constant10' '6/60') ?? '0.0';
    cons48 = await Helper.getData('constant10' '6/48') ?? '0.0';
    cons38 = await Helper.getData('constant10' '6/38') ?? '0.0';
    cons36 = await Helper.getData('constant10' '6/36') ?? '0.0';
    cons30 = await Helper.getData('constant10' '6/30') ?? '0.0';
    cons24 = await Helper.getData('constant10' '6/24') ?? '0.0';
    cons19 = await Helper.getData('constant10' '6/19') ?? '0.0';
    cons18 = await Helper.getData('constant10' '6/18') ?? '0.0';
    cons15 = await Helper.getData('constant10' '6/15') ?? '0.0';
    cons9_5 = await Helper.getData('constant10' '6/9.5') ?? '0.0';
    cons9 = await Helper.getData('constant10' '6/9') ?? '0.0';
    cons7_5 = await Helper.getData('constant10' '6/7.5') ?? '0.0';
    cons6 = await Helper.getData('constant10' '6/6') ?? '0.0';
    cons5 = await Helper.getData('constant10' '6/5') ?? '0.0';
    return true;
    // setState(() {});
  }

  double calculatePixel(int feat, String type) {
    double calculatedSize = 0;
    if (type == "6/60") {
      calculatedSize =
          feat / 4 * MM_60 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons60));
    } else if (type == "6/48") {
      calculatedSize =
          feat / 4 * MM_48 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons48));
    } else if (type == "6/38") {
      calculatedSize =convertConstant(distance, 
          feat / 4) * MM_38 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons38));
    } else if (type == "6/36") {
      calculatedSize =
          feat / 4 * MM_36 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons36));
    } else if (type == "6/30") {
      calculatedSize =
          feat / 4 * MM_30 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons30));
    } else if (type == "6/24") {
      calculatedSize =
          feat / 4 * MM_24 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons24));
    } else if (type == "6/19") {
      calculatedSize =
          feat / 4 * MM_19 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons19));
    } else if (type == "6/18") {
      calculatedSize =
          feat / 4 * MM_18 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons18));
    } else if (type == "6/15") {
      calculatedSize =
          feat / 4 * MM_15 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons15));
    } else if (type == "6/12") {
      calculatedSize =
          feat / 4 * MM_12 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons12));
    } else if (type == "6/9.5") {
      calculatedSize =
          feat / 4 * MM_9_5 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons9_5));
    } else if (type == "6/9") {
      calculatedSize =
          feat / 4 * MM_9 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons9));
    } else if (type == "6/7.5") {
      calculatedSize =
          feat / 4 * MM_7_5 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons7_5));
    } else if (type == "6/6") {
      calculatedSize =
          feat / 4 * MM_6 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons6));
    } else if (type == "6/5") {
      calculatedSize =
          feat / 4 * MM_5 * 3.7795275591 * 0.846 + convertConstant(distance, double.parse(cons5));
    }
    double finalSize = getConstant(widget.image, calculatedSize);
    return finalSize;
  }

  setImage(String image) {
    if (initialState) {
      List<ChartItemSnellan> chartItemsList = [
        ChartItemSnellan(
            textLeft: '6/60',
            textRight: '20/200',
            rotations: enableRotation ? [0] : [-1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/60'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/36',
            textRight: '20/120',
            rotations: enableRotation ? [0, 0] : [-1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/36'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/24',
            textRight: '20/80',
            rotations: enableRotation ? [270, 270, 0] : [-1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/24'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/18',
            textRight: '20/60',
            rotations: enableRotation ? [0, 270, 90, 0] : [-1, -1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/18'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/12',
            textRight: '20/40',
            rotations:
                enableRotation ? [0, 180, 180, 90, 0] : [-1, -1, -1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/12'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/9',
            textRight: '20/30',
            rotations: enableRotation
                ? [0, 180, 180, 90, 0, 0]
                : [-1, -1, -1, -1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/9'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/6',
            textRight: '20/20',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0, 0]
                : [-1, -1, -1, -1, -1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/6'),
            language: widget.image),
        ChartItemSnellan(
            textLeft: '6/5',
            textRight: '20/18',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0, 0, 0]
                : [-1, -1, -1, -1, -1, -1, -1, -1],
            image: image,
            imageSize: calculatePixel(int.parse(distance), '6/5'),
            language: widget.image),
      ];
      initialState = false;
      return chartItemsList;
    } else
      return widget.chartItemsList;
  }

  final String _chars = 'CDEFLOPTZ';
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

  switchChart(bool right) {
    if (right) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SnellanChartScreen(
                    image: 'Numbers',
                  )));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SnellanChartScreen(
                    image: 'Letters',
                  )));
    }
  }

  loadImage() {
    String itemImage = widget.image;
    if (widget.image == 'Letters') {
      itemImage = 'Alphabets';
      enableRotation = false;
    } else if (widget.image == 'Numbers') {
      itemImage = 'Numbers';
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
                RightButtonIntent: CallbackAction<RightButtonIntent>(
                    onInvoke: (intent) => {switchChart(true)}),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => {switchChart(false)}),
                UpButtonIntent: CallbackAction<UpButtonIntent>(
                    onInvoke: (intent) => {scrollVertical(false)}),
                DownButtonIntent: CallbackAction<DownButtonIntent>(
                    onInvoke: (intent) => {scrollVertical(true)}),
              },
              child: Focus(
                focusNode: focus,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: verticalScrollController,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    child: Center(
                      child: Container(
                        // width: calculatePixel(int.parse(distance), widget.chartItemsList[0].textLeft)*13.8,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            widget.chartItemsList[0],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[1],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[2],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[3],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[4],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[5],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[6],
                            const SizedBox(
                              height: 20,
                            ),
                            widget.chartItemsList[7],
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ));
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
    // FocusScope.of(context).requestFocus(focus);
    return inverse ? InvertColors(child: waitForWidget()) : waitForWidget();
  }

  // double calculatePixel(int feat, String type) {
  //   if (type == "6/60") {
  //     return feat / 4 * MM_60 * 3.7795275591 * 0.846;
  //   } else if (type == "6/48") {
  //     return feat / 4 * MM_48 * 3.7795275591 * 0.846;
  //   } else if (type == "6/38") {
  //     return feat / 4 * MM_38 * 3.7795275591 * 0.846;
  //   } else if (type == "6/36") {
  //     return feat / 4 * MM_36 * 3.7795275591 * 0.846;
  //   } else if (type == "6/30") {
  //     return feat / 4 * MM_30 * 3.7795275591 * 0.846;
  //   } else if (type == "6/24") {
  //     return feat / 4 * MM_24 * 3.7795275591 * 0.846;
  //   } else if (type == "6/19") {
  //     return feat / 4 * MM_19 * 3.7795275591 * 0.846;
  //   } else if (type == "6/18") {
  //     return feat / 4 * MM_18 * 3.7795275591 * 0.846;
  //   } else if (type == "6/15") {
  //     return feat / 4 * MM_15 * 3.7795275591 * 0.846;
  //   } else if (type == "6/12") {
  //     return feat / 4 * MM_12 * 3.7795275591 * 0.846;
  //   } else if (type == "6/9.5") {
  //     return feat / 4 * MM_9_5 * 3.7795275591 * 0.846;
  //   } else if (type == "6/9") {
  //     return feat / 4 * MM_9 * 3.7795275591 * 0.846;
  //   } else if (type == "6/7.5") {
  //     return feat / 4 * MM_7_5 * 3.7795275591 * 0.846;
  //   } else if (type == "6/6") {
  //     return feat / 4 * MM_6 * 3.7795275591 * 0.846;
  //   }
  //   return 0;
  // }
}
