import 'package:eyevision/constants/constants.dart';
import 'package:eyevision/screens/menu.dart';
import 'package:eyevision/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helper.dart';
import 'login.dart';

class InversionSetting extends StatefulWidget {
  const InversionSetting({super.key});

  @override
  State<InversionSetting> createState() => _ModeSettingState();
}

class _ModeSettingState extends State<InversionSetting> {
  FocusNode item1Focus = FocusNode();
  FocusNode item2Focus = FocusNode();
  bool initialFocus = true;

  changeFocus(BuildContext context, FocusNode node) {
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('inversion', value);
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('inversion');
  }

  checkMode() async {
    if (initialFocus) {
      String value = await getData() ?? '';
      if (value == 'invert') {
        FocusScope.of(context).requestFocus(item2Focus);
      } else {
        FocusScope.of(context).requestFocus(item1Focus);
      }
    }
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
                      Helper.removeData('inversion');
                      Helper.setData('inversion', 'Normal');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Mode set to: Normal'),
                      ));
                      Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item1Focus,
                    child: Container(
                      width: 500,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: (item1Focus.hasFocus)
                          ? const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(106, 255, 255, 255))
                          : const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(88, 0, 0, 0),
                            ),
                      child: const Text(
                        "Normal",
                        style: TextStyle(color: Colors.white),
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
                      changeFocus(context, item1Focus);
                    }),
                    EnterButtonIntent: CallbackAction(onInvoke: (intent) {
                      Helper.removeData('inversion');
                      Helper.setData('inversion', 'invert');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Mode set to: Invert'),
                      ));
                      Navigator.pop(context);
                    }),
                  },
                  child: Focus(
                    focusNode: item2Focus,
                    child: Container(
                      width: 500,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: (item2Focus.hasFocus)
                          ? const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(106, 255, 255, 255))
                          : const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(88, 0, 0, 0),
                            ),
                      child: const Text("Invert",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    item1Focus.dispose();
    item2Focus.dispose();
    super.dispose();
  }
}
