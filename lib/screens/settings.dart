import 'package:eyevision/screens/callibration-screen.dart';
import 'package:eyevision/screens/distance-setting.dart';
import 'package:eyevision/screens/invert-settings.dart';
import 'package:eyevision/screens/language-setting.dart';
import 'package:eyevision/screens/mode-setting.dart';
import 'package:eyevision/screens/select-font-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../utils/helper.dart';
import '../utils/menuItem.dart';
import 'login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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

  changeFocus(BuildContext context, FocusNode node) {
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (initialFocus) {
      FocusScope.of(context).requestFocus(item1Focus);
    }
    Helper.getData('mode').then((value) => print(value));
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
            LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
          },
          child: GridView.count(
              controller: scrollController,
              crossAxisCount: 4,
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              padding: const EdgeInsets.all(60),
              children: [
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item1Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      // Navigator.of(context).pushNamed('/chart');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ModeSetting()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/mirror-icon.jpg",
                    name: 'MODE',
                    focusNode: item1Focus,
                    image: 'assets/chart/mirror-icon.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item1Focus.unfocus();
                      // changeFocus(context, modeFocus);
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DistanceSetting()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/distance-icon.png",
                    name: 'DISTANCE',
                    focusNode: item2Focus,
                    image: 'assets/chart/distance-icon.png',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item3Focus.unfocus();
                      // changeFocus(context, item1Focus);
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectFontScreen()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/callibration.jpg",
                    name: 'CALLIBRATE',
                    focusNode: item3Focus,
                    image: 'assets/chart/logout.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item3Focus.unfocus();
                      // changeFocus(context, item1Focus);
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageSetting()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/language.jpg",
                    name: 'LANGUAGE',
                    focusNode: item4Focus,
                    image: 'assets/chart/logout.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item3Focus.unfocus();
                      // changeFocus(context, item1Focus);
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InversionSetting()));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/invert.png",
                    name: 'COLOR MODE',
                    focusNode: item5Focus,
                    image: 'assets/chart/logout.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item3Focus.unfocus();
                      // changeFocus(context, item1Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item2Focus.unfocus();
                      // changeFocus(context, item3Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Helper.removeData('login');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/login', (Route<dynamic> route) => false);
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/logout.jpg",
                    name: 'LOGOUT',
                    focusNode: item6Focus,
                    image: 'assets/chart/logout.jpg',
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
