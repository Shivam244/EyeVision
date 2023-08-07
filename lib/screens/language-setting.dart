import 'dart:collection';
import 'package:eyevision/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helper.dart';
import 'login.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _ModeSettingState();
}

class _ModeSettingState extends State<LanguageSetting> {
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
  bool hindiSelected = false;
  bool tamilSelected = false;
  bool arabicSelected = false;
  bool assameseSelected = false;
  bool bengaliSelected = false;
  bool gujratiSelected = false;
  bool kannadaSelected = false;
  bool malayalamSelected = false;
  bool nepaliSelected = false;
  bool oriyaSelected = false;
  bool punjabiSelected = false;
  bool urduSelected = false;
  bool teluguSelected = false;
  bool initialFocus = true;
  String lang1 = 'Hindi';
  String lang2 = 'Tamil';
  String lang3 = 'Telugu';
  Queue<String> languageQueue = Queue();

  @override
  initState() {
    getLanguages();
    super.initState();
  }

  getLanguages() async {
    await Helper.getData('lang1').then((value) => {
          (value != '') ? (lang1 = value) : lang1 = 'Hindi',
        });
    await Helper.getData('lang2')
        .then((value) => {(value != '') ? (lang2 = value) : lang2 = 'Tamil'});
    await Helper.getData('lang3')
        .then((value) => {(value != '') ? (lang3 = value) : lang3 = 'Telugu'});
    languageQueue = Queue.from([lang1, lang2, lang3]);
    reflectLanguage();
  }

  changeFocus(BuildContext context, FocusNode node) {
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('mode', value);
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('mode');
  }

  checkMode() async {
    if (initialFocus) {
      String value = await getData() ?? '';
      if (value == 'Reverse') {
        FocusScope.of(context).requestFocus(item2Focus);
      } else {
        FocusScope.of(context).requestFocus(item1Focus);
      }
    }
  }

  selectLanguage(String language) {
    if (languageQueue.length == 3) {
      languageQueue.removeFirst();
      languageQueue.add(language);
    } else {
      languageQueue.add(language);
    }
    Helper.setData('lang1', languageQueue.elementAt(0));
    Helper.setData('lang2', languageQueue.elementAt(1));
    Helper.setData('lang3', languageQueue.elementAt(2));
    Helper.setData('languageChanged', 'true');
    reflectLanguage();
  }

  reflectLanguage() {
    hindiSelected = false;
    tamilSelected = false;
    arabicSelected = false;
    assameseSelected = false;
    bengaliSelected = false;
    gujratiSelected = false;
    kannadaSelected = false;
    malayalamSelected = false;
    nepaliSelected = false;
    oriyaSelected = false;
    punjabiSelected = false;
    urduSelected = false;
    teluguSelected = false;

    for (var lang1 in languageQueue) {
      if (lang1 == 'Hindi') {
        hindiSelected = true;
      } else if (lang1 == 'Tamil') {
        tamilSelected = true;
      } else if (lang1 == 'Telugu') {
        teluguSelected = true;
      } else if (lang1 == 'Arabic') {
        arabicSelected = true;
      } else if (lang1 == 'Assamese') {
        assameseSelected = true;
      } else if (lang1 == 'Gujrati') {
        gujratiSelected = true;
      } else if (lang1 == 'Kannada') {
        kannadaSelected = true;
      } else if (lang1 == 'Malayalam') {
        malayalamSelected = true;
      } else if (lang1 == 'Nepali') {
        nepaliSelected = true;
      } else if (lang1 == 'Oriya') {
        oriyaSelected = true;
      } else if (lang1 == 'Punjabi') {
        punjabiSelected = true;
      } else if (lang1 == 'Urdu') {
        urduSelected = true;
      } else if (lang1 == 'Bengali') {
        bengaliSelected = true;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    checkMode();
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item1Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Hindi');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Normal');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Normal'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item1Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item1Focus.hasFocus)
                          ? hindiSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : hindiSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hindi",
                            style: TextStyle(color: Colors.white),
                          ),
                          hindiSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, item1Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item2Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Tamil');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item2Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item2Focus.hasFocus)
                          ? tamilSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : tamilSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Tamil",
                            style: TextStyle(color: Colors.white),
                          ),
                          tamilSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, item2Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item3Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Telugu');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item3Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item3Focus.hasFocus)
                          ? teluguSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : teluguSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Telugu",
                            style: TextStyle(color: Colors.white),
                          ),
                          teluguSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item3Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item4Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Arabic');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item4Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item4Focus.hasFocus)
                          ? arabicSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : arabicSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Arabic",
                            style: TextStyle(color: Colors.white),
                          ),
                          arabicSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, item4Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item5Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Assamese');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item5Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item5Focus.hasFocus)
                          ? assameseSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : assameseSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Assamese",
                            style: TextStyle(color: Colors.white),
                          ),
                          assameseSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item5Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item6Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Bengali');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item6Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item6Focus.hasFocus)
                          ? bengaliSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : bengaliSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Bengali",
                            style: TextStyle(color: Colors.white),
                          ),
                          bengaliSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item6Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item7Focus.unfocus();
                      changeFocus(context, item8Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Punjabi');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item7Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item7Focus.hasFocus)
                          ? punjabiSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : punjabiSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Punjabi",
                            style: TextStyle(color: Colors.white),
                          ),
                          punjabiSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item7Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item8Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Kannada');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item8Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item8Focus.hasFocus)
                          ? kannadaSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : kannadaSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Kannada",
                            style: TextStyle(color: Colors.white),
                          ),
                          kannadaSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item8Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item9Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Malayalam');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item9Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item9Focus.hasFocus)
                          ? malayalamSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : malayalamSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Malayalam",
                            style: TextStyle(color: Colors.white),
                          ),
                          malayalamSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item9Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item10Focus.unfocus();
                      changeFocus(context, item11Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Urdu');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item10Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item10Focus.hasFocus)
                          ? urduSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : urduSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Urdu",
                            style: TextStyle(color: Colors.white),
                          ),
                          urduSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Actions(
                  actions: <Type, Action<Intent>>{
                    UpButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item10Focus);
                    }),
                    DownButtonIntent: CallbackAction(onInvoke: (intent) {
                      item11Focus.unfocus();
                      changeFocus(context, item12Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      selectLanguage('Oriya');

                      // Helper.removeData('mode');
                      // Helper.setData('mode', 'Reverse');
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Mode set to: Reverse'),
                      // ));
                      // Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item11Focus,
                    child: Container(
                      width: 500,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: (item11Focus.hasFocus)
                          ? oriyaSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(250, 16, 85, 4))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(106, 255, 255, 255))
                          : oriyaSelected
                              ? const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(251, 4, 22, 1))
                              : const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(88, 0, 0, 0),
                                ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Oriya",
                            style: TextStyle(color: Colors.white),
                          ),
                          oriyaSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 15)
                              : const Text('')
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Actions(
                //   actions: <Type, Action<Intent>>{
                //     UpButtonIntent: CallbackAction(onInvoke: (intent) {
                //       item12Focus.unfocus();
                //       changeFocus(context, item11Focus);
                //     }),
                //     DownButtonIntent: CallbackAction(onInvoke: (intent) {
                //       item12Focus.unfocus();
                //       changeFocus(context, item13Focus);
                //     }),
                //     EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                //       selectLanguage('Punjabi');

                //       // Helper.removeData('mode');
                //       // Helper.setData('mode', 'Reverse');
                //       // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       //     content: Text('Mode set to: Reverse'),
                //       // ));
                //       // Navigator.pop(context);
                //     }),
                //   },
                //   child: Focus(
                //     focusNode: item12Focus,
                //     child: Container(
                //       width: 500,
                //       height: 30,
                //       alignment: Alignment.center,
                //       decoration: (item12Focus.hasFocus)
                //           ? punjabiSelected
                //               ? const BoxDecoration(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   color: Color.fromARGB(250, 16, 85, 4))
                //               : const BoxDecoration(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   color: Color.fromARGB(106, 255, 255, 255))
                //           : punjabiSelected
                //               ? const BoxDecoration(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   color: Color.fromARGB(251, 4, 22, 1))
                //               : const BoxDecoration(
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(10)),
                //                   color: Color.fromARGB(88, 0, 0, 0),
                //                 ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           const Text(
                //             "Punjabi",
                //             style: TextStyle(color: Colors.white),
                //           ),
                //           punjabiSelected
                //               ? const Icon(Icons.check,
                //                   color: Colors.white, size: 15)
                //               : const Text('')
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ]),
            ),
          ),
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
    super.dispose();
  }
}
