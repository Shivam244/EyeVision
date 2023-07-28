import 'package:eyevision/utils/misc-chart-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem.dart';
import 'login.dart';

class MiscChartScreen extends StatefulWidget {
  MiscChartScreen({super.key});
  List<MiscChartItem> chartItemsList = [];
  @override
  State<MiscChartScreen> createState() => _AstigChartScreenState();
}

class _AstigChartScreenState extends State<MiscChartScreen> {
  int itemIndex = 0;
  late MiscChartItem currentItem;
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

  setImage() {
    List<MiscChartItem> chartItemsList = [
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations: [0],
          image: 'assets/chart/misc/Worth4.png',
          imageSize: 510,
          background: "black",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations: [0],
          background: "white",
          image: 'assets/chart/misc/Amsler.png',
          imageSize: 510,
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          background: "white",
          image: 'assets/chart/misc/Phoria1.png',
          imageSize: 510,
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Phoria2.png',
          imageSize: 510,
          background: "white",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Phoria3.png',
          imageSize: 510,
          background: "white",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Phoria4.png',
          imageSize: 510,
          background: "white",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Phoria5.png',
          imageSize: 510,
          background: "white",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          background: "white",
          image: 'assets/chart/misc/Phoria6.png',
          imageSize: 510,
          
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Fix1.png',
          imageSize: 510,
          background: "black",
          language: ''),
      const MiscChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/misc/Fix2.png',
          imageSize: 510,
          background: "black",
          language: ''),  
    ];
    return chartItemsList;
  }

  @override
  Widget build(BuildContext context) {
    widget.chartItemsList = setImage();
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