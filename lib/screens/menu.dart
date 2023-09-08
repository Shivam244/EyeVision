import 'dart:ui';

import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/screens/chart-screen-mixed.dart';
import 'package:eyevision/screens/educational-menu.dart';
import 'package:eyevision/screens/logmar-chart-screen.dart';
import 'package:eyevision/screens/pediatric-sub-menu.dart';
import 'package:eyevision/screens/red-green-screen.dart';
import 'package:eyevision/screens/settings.dart';
import 'package:eyevision/screens/snellan-chart-screen.dart';
import 'package:eyevision/utils/misc-chart-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/helper.dart';
import '../utils/menuItem.dart';
import 'chart-screen.dart';
import 'contact-us.dart';
import 'contrast-screen.dart';
import 'dots-chart-screen.dart';
import 'ishihara-chart-screen.dart';
import 'login.dart';
import 'misc-chart-screen.dart';
import 'pediatric-chart-screen.dart';

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
  FocusNode item11Focus = FocusNode();
  FocusNode item12Focus = FocusNode();
  FocusNode item13Focus = FocusNode();
  FocusNode item14Focus = FocusNode();
  FocusNode item15Focus = FocusNode();
  FocusNode item16Focus = FocusNode();
  FocusNode item17Focus = FocusNode();
  FocusNode item18Focus = FocusNode();
  FocusNode modeFocus = FocusNode();
  bool initialFocus = true;

  String mode = modeList.first;
  String distance = distanceList.first;
  String lang1 = 'Hindi';
  String lang2 = 'Tamil';
  String lang3 = 'Telugu';

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

  getLanguages() async {
    Helper.setData('languageChanged', 'false');
    await Helper.containes('lang1').then((value) => {
          if (!value) {Helper.setData('lang1', 'Hindi')}
        });
    await Helper.containes('lang2').then((value) => {
          if (!value) {Helper.setData('lang2', 'Tamil')}
        });
    await Helper.containes('lang3').then((value) => {
          if (!value) {Helper.setData('lang3', 'Telugu')}
        });
    await Helper.getData('lang1').then((value) => {
          (value != '') ? (lang1 = value) : lang1 = 'Hindi',
        });
    await Helper.getData('lang2')
        .then((value) => {(value != '') ? (lang2 = value) : lang2 = 'Tamil'});
    await Helper.getData('lang3')
        .then((value) => {(value != '') ? (lang3 = value) : lang3 = 'Telugu'});
    setState(() {});
  }

  checkLanguageChanged() {
    Helper.getData('languageChanged').then((value) => {
          if (value == 'true') {setState(() {})}
        });
  }

  @override
  void initState() {
    // ServicesBinding.instance.keyboard.addHandler(_onKey);
    getLanguages();
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  GlobalKey? dropdownButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // checkLanguageChanged();
    getLanguages();
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
                          changeFocus(context, item6Focus);
                        }),
                        EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                          // Navigator.of(context).pushNamed('/chart');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()));
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
              crossAxisCount: 6,
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
                      changeFocus(context, item7Focus);
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
                    icon: "assets/icons/C.jpg",
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
                      changeFocus(context, item8Focus);
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
                    icon: "assets/icons/E.jpg",
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
                      changeFocus(context, item9Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChartScreenMixed(type: 'Alphabets')));
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
                      changeFocus(context, item10Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChartScreenMixed(
                                    type: 'Numbers',
                                  )));
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
                      changeFocus(context, item11Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChartScreenMixed(type: lang1)));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/${lang1.toLowerCase()}.jpg",
                    name: lang1.toUpperCase(),
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
                      changeFocus(context, item12Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChartScreenMixed(type: lang2)));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/${lang2.toLowerCase()}.jpg",
                    name: lang2.toUpperCase(),
                    focusNode: item6Focus,
                    image: 'Telugu',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item1Focus);
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
                      changeFocus(context, item13Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChartScreenMixed(type: lang3)));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/${lang3.toLowerCase()}.jpg",
                    name: lang3.toUpperCase(),
                    focusNode: item7Focus,
                    image: 'Hindi',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item14Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/astigfan.jpg",
                    name: 'ASTIG FAN',
                    focusNode: item8Focus,
                    image: 'assets/icons/astigFan.png',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item8Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item15Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IshiharaScreen()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/ishara.jpg",
                    name: 'ISHIHARA',
                    focusNode: item9Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item11Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item16Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PediatricSubMenu()));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             PediatricScreen(name: "Pediatric",)));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/pediatric.jpg",
                    name: 'PEDIATRIC',
                    focusNode: item10Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item12Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item17Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContrastScreen(
                                    image: 'C',
                                  )));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/contrast.jpg",
                    name: 'CONTRAST',
                    focusNode: item11Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item12Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item12Focus.unfocus();
                      changeFocus(context, item13Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item12Focus.unfocus();
                      changeFocus(context, item11Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item12Focus.unfocus();
                      changeFocus(context, item18Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EducationalMenu()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational.jpg",
                    name: 'EDUCATIONAL',
                    focusNode: item12Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item13Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item13Focus.unfocus();
                      changeFocus(context, item14Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item13Focus.unfocus();
                      changeFocus(context, item12Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item13Focus.unfocus();
                      changeFocus(context, item13Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SnellanChartScreen(
                                    image: 'Letters',
                                  )));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/snellan.jpg",
                    name: 'SNELLAN',
                    focusNode: item13Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item14Focus.unfocus();
                      changeFocus(context, item8Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item14Focus.unfocus();
                      changeFocus(context, item15Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item14Focus.unfocus();
                      changeFocus(context, item13Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item14Focus.unfocus();
                      changeFocus(context, item14Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RedGreenScreen()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/rg.png",
                    name: 'RED GREEN',
                    focusNode: item14Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item16Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item14Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item15Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LogmarChartScreen(image: 'Letters')));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/logmar.jpg",
                    name: 'LOGMAR',
                    focusNode: item15Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item16Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item16Focus.unfocus();
                      changeFocus(context, item17Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item16Focus.unfocus();
                      changeFocus(context, item15Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item16Focus.unfocus();
                      changeFocus(context, item16Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MiscChartScreen()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/misc.png",
                    name: 'MISC',
                    focusNode: item16Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item17Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item17Focus.unfocus();
                      changeFocus(context, item18Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item17Focus.unfocus();
                      changeFocus(context, item16Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item17Focus.unfocus();
                      changeFocus(context, item17Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DotsChartScreen(
                                    type: 'Dots',
                                  )));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/dots.jpg",
                    name: 'DOTS',
                    focusNode: item17Focus,
                    image: 'assets/icons/ishihara.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item18Focus.unfocus();
                      changeFocus(context, item12Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item18Focus.unfocus();
                      changeFocus(context, item1Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item18Focus.unfocus();
                      changeFocus(context, item17Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item18Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    Numpad8ButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.of(context).pushNamed('/astig');
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUs(
                                    )));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/contactus.png",
                    name: 'CONTACT US',
                    focusNode: item18Focus,
                    image: 'assets/icons/ishihara.jpg',
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
    item11Focus.dispose();
    item12Focus.dispose();
    item13Focus.dispose();
    item14Focus.dispose();
    item15Focus.dispose();
    item16Focus.dispose();
    item17Focus.dispose();
    item18Focus.dispose();
    super.dispose();
  }
}
