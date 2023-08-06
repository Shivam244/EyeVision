import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/chartItem.dart';
import 'login.dart';

class AstigChartScreen extends StatefulWidget {
  AstigChartScreen({super.key});
  List<ChartItem> chartItemsList = [];
  @override
  State<AstigChartScreen> createState() => _AstigChartScreenState();
}

class _AstigChartScreenState extends State<AstigChartScreen> {
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

  setImage() {
    List<ChartItem> chartItemsList = [
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations: 1,
          image: 'assets/chart/astigFan/1.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations: 1,
          image: 'assets/chart/astigFan/2.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/3.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/4.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/5.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/6.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/7.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/8.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/9.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/10.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/11.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/12.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/13.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/14.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/15.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/16.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/17.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/18.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  1,
          image: 'assets/chart/astigFan/19.jpg',
          imageSize: 510,
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