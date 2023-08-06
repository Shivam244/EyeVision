import 'package:eyevision/utils/list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../utils/helper.dart';
import 'login.dart';

class DistanceSetting extends StatefulWidget {
  const DistanceSetting({super.key});

  @override
  State<DistanceSetting> createState() => _DistanceSettingState();
}

class _DistanceSettingState extends State<DistanceSetting> {
  FocusNode item1Focus = FocusNode();
  // FocusNode item2Focus = FocusNode();
  // FocusNode item3Focus = FocusNode();
  // FocusNode item4Focus = FocusNode();
  // FocusNode item5Focus = FocusNode();
  // FocusNode item6Focus = FocusNode();
  // FocusNode item7Focus = FocusNode();
  // FocusNode item8Focus = FocusNode();
  // FocusNode item9Focus = FocusNode();
  // FocusNode item10Focus = FocusNode();
  // FocusNode item11Focus = FocusNode();
  // FocusNode item12Focus = FocusNode();
  // FocusNode item13Focus = FocusNode();
  // FocusNode item14Focus = FocusNode();
  // FocusNode item15Focus = FocusNode();
  // FocusNode item16Focus = FocusNode();
  bool initialFocus = true;
  int distance = 5;
  bool alreadyCalled = false;
  changeFocus(BuildContext context, FocusNode node) {
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('distance', value);
    setState(() {});
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('distance');
  }

  checkDistance() async {
    if (initialFocus) {
      String value = await getData() ?? '5';
      print(value);
      distance = int.parse(value);
      setState(() {});
      initialFocus = false;
    }
  }

  bool _onKey(KeyEvent event) {
    var key = event.logicalKey.keyLabel;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(key),
    //   duration: const Duration(microseconds: 500),
    // ));
    if (alreadyCalled) {
      alreadyCalled = false;
      return true;
    }
    if (key == "Arrow Up") {
      if (distance < 20) distance = distance + 1;
      setState(() {});
    } else if (key == "Arrow Down") {
      if (distance > 5) distance = distance - 1;
      setState(() {});
    } else if (key == "Arrow Right") {
      // setData(distance.toString());
      // Navigator.pop(context);
      // FocusScope.of(context).requestFocus(item3Focus);
    } else {
      // item3Focus.unfocus();
    }
    alreadyCalled = true;
    // print(event);
    print(key);
    return true;
  }

  @override
  void initState() {
    // ServicesBinding.instance.keyboard.addHandler(_onKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkDistance();
    FocusScope.of(context).requestFocus(item1Focus);
    return Scaffold(
      backgroundColor: backgroundColour,
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
            UpButtonIntent: CallbackAction(onInvoke: (intent) {
              if (distance < 20) distance = distance + 1;
              setState(() {});
            }),
            DownButtonIntent: CallbackAction(onInvoke: (intent) {
              if (distance > 5) distance = distance - 1;
              setState(() {});
            }),
            EnterButtonIntent: CallbackAction(onInvoke: (intent) {
              // setData(distance.toString());
              Helper.removeData('distance');
              Helper.setData('distance', distance.toString());
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Distance set to: ${distance.toString()}ft'),
              ));
              Navigator.pop(context);
            }),
          },
          child: Focus(
            focusNode: item1Focus,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: backgroundColour),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                        height: 100,
                        child: IconButton(
                          onPressed: () => {if (distance < 20) distance++},
                          icon: const Icon(
                            Icons.arrow_upward_outlined,
                            color: Color.fromARGB(137, 216, 215, 215),
                          ),
                          iconSize: 50,
                        )),
                    Container(
                        height: 30,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Color.fromARGB(94, 37, 37, 37)),
                        child: Text(
                          "${distance}ft",
                          style: const TextStyle(color: Colors.white),
                        )),
                    Container(
                        height: 100,
                        child: IconButton(
                            onPressed: () => {if (distance > 5) distance--},
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Color.fromARGB(137, 216, 215, 215),
                            ),
                            iconSize: 50)),
                  ]),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

}
