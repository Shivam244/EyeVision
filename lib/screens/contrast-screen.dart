import 'dart:math';

import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem-snellan.dart';
import '../utils/contrast-chart-item.dart';
import 'login.dart';

class ContrastScreen extends StatefulWidget {
  ContrastScreen({super.key, required this.image});
  String image;
  @override
  State<ContrastScreen> createState() => _ContrastScreenState();
  List<ContastChartItem> chartItemsList = [];
}

class _ContrastScreenState extends State<ContrastScreen> {
  int itemIndex = 0;
  late ContastChartItem currentItem;
  FocusNode focus = FocusNode();
  bool enableRotation = true;
  bool initialState = true;
  List<String> items = ['C', 'E', 'Letters', 'Numbers'];
  int currentPage = 1;
  changeItem(bool next) {
    if (next) {
      // if (itemIndex == items.length - 1) return;
      // itemIndex++;
      // widget.image = items[itemIndex];
      if (currentPage < 4) {
        currentPage++;
      }
    } else {
      // itemIndex--;
      // if (itemIndex < 0) {
      //   itemIndex = 0;
      // }
      // widget.image = items[itemIndex];
      if (currentPage > 1) {
        currentPage--;
      }
    }
    loadImage();
    setState(() {
      initialState = true;
    });
  }

  @override
  initState() {
    super.initState();
  }

  generateItems(int count) {
    List<String> images = [];
    String type = 'Alphabets';
    if (type == 'Alphabets') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomString(1));
      }
    } else if (type == 'Numbers') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomNumber(1));
      }
    } else if (type == 'Hindi') {
      for (int i = 0; i < count; i++) {
        images.add(getRandomHindi(1));
      }
    }
    return images;
  }

  setImage(int list) {
    // List<String> image = generateItems(5);
    if (initialState) {
      List<ContastChartItem> chartItemsList = [];
      List<ContastChartItem> chartItemsList1 = [
        ContastChartItem(
            textLeft: '100',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 1.0,
            language: widget.image),
        ContastChartItem(
            textLeft: '95',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.95,
            language: widget.image),
        ContastChartItem(
            textLeft: '90',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.9,
            language: widget.image),
        ContastChartItem(
            textLeft: '85',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.85,
            language: widget.image),
            ContastChartItem(
            textLeft: '80',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.8,
            language: widget.image),
      ];
      List<ContastChartItem> chartItemsList2 = [
        
        ContastChartItem(
            textLeft: '75',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.75,
            language: widget.image),
        ContastChartItem(
            textLeft: '70',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.7,
            language: widget.image),
        ContastChartItem(
            textLeft: '65',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.65,
            language: widget.image),
            ContastChartItem(
            textLeft: '50',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.5,
            language: widget.image),
        ContastChartItem(
            textLeft: '45',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.45,
            language: widget.image),
      ];
      List<ContastChartItem> chartItemsList3 = [
        
        ContastChartItem(
            textLeft: '40',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.4,
            language: widget.image),
        ContastChartItem(
            textLeft: '35',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.35,
            language: widget.image),
            ContastChartItem(
            textLeft: '30',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.3,
            language: widget.image),
        ContastChartItem(
            textLeft: '25',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.25,
            language: widget.image),
        ContastChartItem(
            textLeft: '20',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.2,
            language: widget.image),
      ];
      List<ContastChartItem> chartItemsList4 = [
        
        ContastChartItem(
            textLeft: '15',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.15,
            language: widget.image),
            ContastChartItem(
            textLeft: '10',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.1,
            language: widget.image),
        ContastChartItem(
            textLeft: '5',
            textRight: '',
            rotations: enableRotation
                ? [0, 15, 270, 180, 90, 0]
                : [-1, -1, -1, -1, -1, -1],
            images: generateItems(5),
            opacity: 0.05,
            language: widget.image),
      ];
       if (list == 2) {
        chartItemsList = chartItemsList2;
      } else if (list == 3) {
        chartItemsList = chartItemsList3;
      } else if (list == 4) {
        chartItemsList = chartItemsList4;
      } else {
        chartItemsList = chartItemsList1;
      }
      initialState = false;
      return chartItemsList;
    } else
      return widget.chartItemsList;
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

  loadImage() {
    enableRotation = false;
    widget.chartItemsList = setImage(currentPage);
    currentItem = widget.chartItemsList[itemIndex];
    // widget.chartItemsList.forEach((element) {
    //   print(element.image);
    // });
    print(widget.chartItemsList);
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
                    onInvoke: (intent) => changeItem(true)),
                LeftButtonIntent: CallbackAction<LeftButtonIntent>(
                    onInvoke: (intent) => changeItem(false)),
              },
              child: Focus(
                  focusNode: focus,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        widget.chartItemsList.length>0? widget.chartItemsList[0]: Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.chartItemsList.length>1? widget.chartItemsList[1]: Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.chartItemsList.length>2? widget.chartItemsList[2]: Container() ,
                        const SizedBox(
                          height: 20,
                        ),
                        widget.chartItemsList.length>3? widget.chartItemsList[3]: Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.chartItemsList.length>4? widget.chartItemsList[4]: Container(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
