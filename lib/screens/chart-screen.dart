import 'package:eyevision/utils/chartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({super.key, required this.image});
  final String image;
  @override
  State<ChartScreen> createState() => _ChartScreenState();
  List<ChartItem> chartItemsList = [];

  @override
  void initState() {}
}

class _ChartScreenState extends State<ChartScreen> {
  int itemIndex = 0;
  late ChartItem currentItem;
  FocusNode focus = FocusNode();
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
    setState(() {});
  }

  setImage(String image) {
    List<ChartItem> chartItemsList = [
      ChartItem(
          textLeft: '6/60',
          textRight: '20/200',
          rotations: const [0],
          image: image,
          imageSize: 279.139392),
      ChartItem(
          textLeft: '6/36',
          textRight: '20/120',
          rotations: const [0, 0],
          image: image,
          imageSize: 167.5479733848944),
            ChartItem(
          textLeft: '6/24',
          textRight: '20/80',
          rotations: const [270, 270, 0],
          image: image,
          imageSize: 111.59206787241891),
       ChartItem(
          textLeft: '6/18',
          textRight: '20/60',
          rotations: const [0, 270, 90, 0],
          image: image,
          imageSize: 83.7739866924472),
      ChartItem(
          textLeft: '6/12',
          textRight: '20/40',
          rotations: const [0, 180, 180, 90, 0],
          image: image,
          imageSize: 55.955905512475496),
      ChartItem(
          textLeft: '6/6',
          textRight: '20/20',
          rotations: const [0, 15, 270, 180, 90, 0],
          image: image,
          imageSize: 27.818078130616847),
    ];
    return chartItemsList;
  }

  @override
  Widget build(BuildContext context) {
    widget.chartItemsList = setImage(widget.image);
    currentItem = widget.chartItemsList[itemIndex];
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
              child: Focus(focusNode: focus, child: currentItem),
            )));
  }
}
