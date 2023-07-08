import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/chartItem.dart';
import 'login.dart';

class IshiharaScreen extends StatefulWidget {
  IshiharaScreen({super.key});
  List<ChartItem> chartItemsList = [];
  @override
  State<IshiharaScreen> createState() => _IshiharaScreenState();
}

class _IshiharaScreenState extends State<IshiharaScreen> {
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
          rotations: [0],
          image: 'assets/chart/ishahra/1.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations: [0],
          image: 'assets/chart/ishahra/2.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/3.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/4.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/5.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/6.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/7.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/8.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/9.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/10.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/11.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/12.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/13.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/14.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/15.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/16.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/17.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/18.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/19.jpg',
          imageSize: 510,
          language: ''),
      const ChartItem(
          textLeft: '',
          textRight: '',
          rotations:  [0],
          image: 'assets/chart/ishahra/20.jpg',
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
        backgroundColor: Colors.black,
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