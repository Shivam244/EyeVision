import 'package:eyevision/screens/pediatric-chart-screen.dart';
import 'package:eyevision/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';
import '../utils/helper.dart';
import '../utils/menuItem.dart';
import 'distance-setting.dart';
import 'login.dart';
import 'mode-setting.dart';

class EducationalMenu extends StatefulWidget {
  const EducationalMenu({super.key});

  @override
  State<EducationalMenu> createState() => _EducationalMenuState();
}

class _EducationalMenuState extends State<EducationalMenu> {
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
            LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent()
          },
          child: GridView.count(
              controller: scrollController,
              crossAxisCount: 6,
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
                      changeFocus(context, item7Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      // Navigator.of(context).pushNamed('/chart');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  PediatricScreen(name: "Anatomy")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/anatomy.jpg",
                    name: 'ANATOMY',
                    focusNode: item1Focus,
                    image: 'assets/chart/mirror-icon.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
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
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "Astigmatism")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/astigmatism.jpg",
                    name: 'ASTIGMATISM',
                    focusNode: item2Focus,
                    image: 'assets/chart/distance-icon.png',
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
                      item2Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "cataract")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/cataract.jpg",
                    name: 'CATARACT',
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
                      item4Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "contactlenses")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/contacts.jpg",
                    name: 'CONTACTS',
                    focusNode: item4Focus,
                    image: 'assets/chart/logout.jpg',
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
                      item2Focus.unfocus();
                      changeFocus(context, item11Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "diabetic")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/diabetic.jpg",
                    name: 'DIABETIC',
                    focusNode: item5Focus,
                    image: 'assets/chart/logout.jpg',
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
                      item2Focus.unfocus();
                      changeFocus(context, item12Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "dryeye")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/dryeye.jpg",
                    name: 'DRY EYE',
                    focusNode: item6Focus,
                    image: 'assets/chart/logout.jpg',
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
                      item2Focus.unfocus();
                      changeFocus(context, item13Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "general")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/general.jpg",
                    name: 'GENERAL',
                    focusNode: item7Focus,
                    image: 'assets/chart/logout.jpg',
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
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "glaucoma")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/glaucoma.jpg",
                    name: 'GLAUCOME',
                    focusNode: item8Focus,
                    image: 'assets/chart/logout.jpg',
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
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "iol")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/iol.jpg",
                    name: 'IOL',
                    focusNode: item9Focus,
                    image: 'assets/chart/logout.jpg',
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
                      changeFocus(context, item15Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "lasik")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/lasic.jpg",
                    name: 'LASIC',
                    focusNode: item10Focus,
                    image: 'assets/chart/logout.jpg',
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
                      // item11Focus.unfocus();
                      // changeFocus(context, item16);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "macular")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/macular.jpg",
                    name: 'MACULAR',
                    focusNode: item11Focus,
                    image: 'assets/chart/logout.jpg',
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "myopia")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/myopia.jpg",
                    name: 'MYOPIA',
                    focusNode: item12Focus,
                    image: 'assets/chart/logout.jpg',
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "opticals")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/opticals.jpg",
                    name: 'OPTICALS',
                    focusNode: item13Focus,
                    image: 'assets/chart/logout.jpg',
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
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "prakamaya")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/prkmaya.jpg",
                    name: 'PRAKAMAYA',
                    focusNode: item14Focus,
                    image: 'assets/chart/logout.jpg',
                  ),
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    RightButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item15Focus.unfocus();
                      // changeFocus(context, item3Focus);
                    }),
                    LeftButtonIntent: CallbackAction(onInvoke: (intent) {
                      item15Focus.unfocus();
                      changeFocus(context, item14Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      // item2Focus.unfocus();
                      // changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PediatricScreen(name: "retinal")));
                    }),
                  },
                  child: MenuItem(
                    icon: "assets/icons/educational/retina.jpg",
                    name: 'RETINAL',
                    focusNode: item15Focus,
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
    item11Focus.dispose();
    item12Focus.dispose();
    item13Focus.dispose();
    item14Focus.dispose();
    item15Focus.dispose();
    super.dispose();
  }
}
