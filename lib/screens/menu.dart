import 'dart:ui';

import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/screens/chart-screen-mixed.dart';
import 'package:eyevision/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/menuItem.dart';
import 'chart-screen.dart';
import 'login.dart';

List<String> modeList = ["Normal", "Reversed"];
List<String> distanceList = [
  "6ft",
  "7ft",
  "8ft",
  "9ft",
  '10ft',
  '11ft',
  '12ft',
  '13ft',
  '14ft',
  '15ft',
  '16ft',
  '17ft',
  '18ft',
  '19ft'
];

class MenuPage extends StatefulWidget {
  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  FocusNode item1Focus = FocusNode();
  FocusNode item2Focus = FocusNode();
  FocusNode item3Focus = FocusNode();
  FocusNode item4Focus = FocusNode();
  FocusNode item5Focus = FocusNode();
  FocusNode item6Focus = FocusNode();
  FocusNode item7Focus = FocusNode();
  FocusNode item8Focus = FocusNode();
  FocusNode item9Focus = FocusNode();
  FocusNode item10Focus = FocusNode();
  FocusNode modeFocus = FocusNode();
  bool initialFocus = true;

  String mode = modeList.first;
  String distance = distanceList.first;

  changeFocus(BuildContext context, FocusNode node) {
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  bool _onKey(KeyEvent event) {
    var key = event.logicalKey.keyLabel;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(key),
      duration: const Duration(microseconds: 500),
    ));
    print(event);
    print(key);
    return true;
  }

  @override
  void initState() {
    // ServicesBinding.instance.keyboard.addHandler(_onKey);
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  GlobalKey? dropdownButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (initialFocus) {
      FocusScope.of(context).requestFocus(item1Focus);
    }
    return Scaffold(
        backgroundColor: backgroundColour,
        appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Shortcuts(
              shortcuts: <LogicalKeySet, Intent>{
                LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.arrowRight):
                    RightButtonIntent(),
                LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
              },
              child: Row(
                children: [
                  Image.asset('assets/gif/giphy-unscreen.gif', height: 55),
                  const Padding(padding: EdgeInsets.only(left: 10.0)),
                  const Text(
                    'ACUITY VISION CHART',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 520.0)),
                  Actions(
                      actions: <Type, Action<Intent>>{
                        // UpButtonIntent: CallbackAction(onInvoke: (intent) {
                        //   item1Focus.unfocus();
                        //   changeFocus(context, modeFocus);
                        // }),
                        RightButtonIntent: CallbackAction(onInvoke: (intent) {
                          modeFocus.unfocus();
                          changeFocus(context, item3Focus);
                        }),
                        LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                          modeFocus.unfocus();
                          changeFocus(context, item1Focus);
                        }),
                        DownButtonIntent: CallbackAction(onInvoke: (intent) {
                          modeFocus.unfocus();
                          changeFocus(context, item1Focus);
                        }),
                        EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                          // Navigator.of(context).pushNamed('/chart');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()));
                        }),
                      },
                      child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.settings),
                        focusNode: modeFocus,
                        focusColor: const Color.fromARGB(80, 255, 255, 255),
                      ))
                ],
              ),
            )),
        body: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent(),
            LogicalKeySet(LogicalKeyboardKey.digit8): Numpad8ButtonIntent()
          },
          child: GridView.count(
              controller: scrollController,
              crossAxisCount: 5,
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              padding: const EdgeInsets.all(60),
              childAspectRatio: (0.5 / 0.5),
              children: [
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item1Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      // Navigator.of(context).pushNamed('/chart');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreen(image: 'C')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/landoltc.png",
                    name: 'LANDOLT C',
                    focusNode: item1Focus,
                    image: 'assets/chart/lCsingle.png',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, item1Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreen(image: 'E')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/eIcon.png",
                    name: 'THUMBLING E',
                    focusNode: item2Focus,
                    image: 'assets/chart/snellenE.png',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreenMixed(type: 'Alphabets')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/abc.png",
                    name: 'ALPHABETS',
                    focusNode: item3Focus,
                    image: 'Letters',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                     UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreenMixed(type: 'Numbers',)));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/numbers.png",
                    name: 'NUMERICS',
                    focusNode: item4Focus,
                    image: 'Numbers',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                     UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreen(image: 'Tamil')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/tamil.png",
                    name: 'TAMIL',
                    focusNode: item5Focus,
                    image: 'Tamil',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                     UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreen(image: 'Telugu')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/telugu.jpg",
                    name: 'TELUGU',
                    focusNode: item6Focus,
                    image: 'Telugu',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                     UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item8Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreenMixed(type: 'Hindi')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/hindi.png",
                    name: 'HINDI',
                    focusNode: item7Focus,
                    image: 'Hindi',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, modeFocus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/astigFan.png",
                    name: 'ASTIG FAN',
                    focusNode: item8Focus,
                    image: 'assets/icons/astigFan.png',
                  ),
                ),
              ]),
        ));
  }

  @override
  void dispose() {
    item1Focus.dispose();
    item2Focus.dispose();
    item3Focus.dispose();
    item4Focus.dispose();
    item5Focus.dispose();
    item6Focus.dispose();
    item7Focus.dispose();
    item8Focus.dispose();
    item9Focus.dispose();
    item10Focus.dispose();
    super.dispose();
  }
}
