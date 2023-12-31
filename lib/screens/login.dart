import 'package:animate_gradient/animate_gradient.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../main.dart';

class LeftButtonIntent extends Intent {}

class RightButtonIntent extends Intent {}

class UpButtonIntent extends Intent {}

class DownButtonIntent extends Intent {}

class EnterButtonIntent extends Intent {}

class AbortButtonIntent extends Intent {}

class Numpad8ButtonIntent extends Intent {}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "";
  String password = "";
  bool formValid = true;
  String login = 'false';
  // FocusNode? userNameFocus;
  // FocusNode? passwordFocus;
  // FocusNode? submitButtonFocus;

  setInitialFocus() {}

  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode submitButtonFocus = FocusNode();
  //  FocusScope.of(context).requestFocus(userNameFocus);

  changeFocus(BuildContext context, FocusNode node) {
    formValid = true;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  checkLoggedIn() {
    Helper.getData('login').then((value) => {
          if (value == 'true') {Navigator.pushNamed(context, "/menu")}
        });
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('distance', value);
  }

  @override
  void initState() {
    checkLoggedIn();
    setData('5');
    super.initState();
  }

  submitForm() {
    if (username == 'admin' && password == '1234') {
      formValid = true;
      Navigator.pushNamed(context, "/menu");
      Helper.setData('login', 'true');
    } else {
      formValid = false;
      submitButtonFocus.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect Username or password')));
      FocusScope.of(context).requestFocus(userNameFocus);
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameFocus?.dispose();
    passwordFocus?.dispose();
    submitButtonFocus?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: backgroundColour,
      body: Center(
          child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width - 60,
          decoration:
              const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 15)]),
          child: AnimateGradient(
            primaryBegin: Alignment.topLeft,
            primaryEnd: Alignment.bottomLeft,
            secondaryBegin: Alignment.bottomLeft,
            secondaryEnd: Alignment.topRight,
            duration: const Duration(seconds: 10),
            primaryColors: const [
              Colors.black,
              Color.fromRGBO(147, 182, 184, 0.612),
              Colors.black,
            ],
            secondaryColors: const [
              Colors.black,
              Color.fromRGBO(147, 182, 184, 0.612),
              Colors.black,
            ],
            child: Shortcuts(
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
                  Expanded(
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Image.asset(
                                    'assets/images/visionlogo.png',
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'ACUITY VISION CHART',
                                    style: GoogleFonts.bebasNeue(
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 30)),
                                  ),
                                )
                              ],
                            ),
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownButtonIntent:
                                    CallbackAction<DownButtonIntent>(
                                        onInvoke: (intent) => changeFocus(
                                            context, passwordFocus!)),
                              },
                              // child: Focus(
                              // focusNode: userNameFocus,
                              child: Container(
                                // decoration: !(userNameFocus?.hasFocus ?? false)
                                //     ? null
                                //     : const BoxDecoration(
                                //         color: Color.fromARGB(55, 255, 255, 255),
                                //         borderRadius:
                                //             BorderRadius.all(Radius.circular(5))),
                                width: 350,
                                child: TextFormField(
                                  controller: usernameController,
                                  onChanged: (value) => {username = value},
                                  focusNode: userNameFocus,
                                  autofocus: true,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (value) {
                                    userNameFocus.unfocus();
                                    changeFocus(context, passwordFocus);
                                  },
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Username',
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelText: 'Username',
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.blueGrey,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                117, 255, 255, 255))),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              // ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Actions(
                              actions: <Type, Action<Intent>>{
                                DownButtonIntent:
                                    CallbackAction<DownButtonIntent>(
                                        onInvoke: (intent) => changeFocus(
                                            context, submitButtonFocus!)),
                                UpButtonIntent: CallbackAction<UpButtonIntent>(
                                    onInvoke: (intent) =>
                                        changeFocus(context, userNameFocus!)),
                              },
                              // child: Focus(
                              // focusNode: passwordFocus,
                              child: Container(
                                width: 350,
                                // decoration: !(passwordFocus?.hasFocus ?? false)
                                //     ? null
                                //     : const BoxDecoration(
                                //         color: Color.fromARGB(55, 255, 255, 255),
                                //         borderRadius:
                                //             BorderRadius.all(Radius.circular(5))),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  onChanged: (value) => {password = value},
                                  focusNode: passwordFocus,
                                  onFieldSubmitted: (value) {
                                    passwordFocus.unfocus();
                                    changeFocus(context, submitButtonFocus);
                                  },
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white),
                                    focusColor: Colors.blueGrey,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                118, 255, 255, 255))),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              // ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Actions(
                              actions: <Type, Action<Intent>>{
                                EnterButtonIntent:
                                    CallbackAction<EnterButtonIntent>(
                                        onInvoke: (intent) => submitForm()),
                                UpButtonIntent: CallbackAction<UpButtonIntent>(
                                    onInvoke: (intent) =>
                                        changeFocus(context, passwordFocus)),
                              },
                              // child: Focus(
                              //   focusNode: submitButtonFocus,
                              child: Container(
                                decoration: !(submitButtonFocus?.hasFocus ??
                                        false)
                                    ? null
                                    : const BoxDecoration(
                                        color:
                                            Color.fromARGB(40, 255, 255, 255),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                child: TextButton(
                                    focusNode: submitButtonFocus,
                                    onPressed: () {
                                      submitForm();
                                    },
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: backgroundColour,
                                        shadowColor: Colors.black,
                                        elevation: 5,
                                        fixedSize: const Size(200, 20)),
                                    child: const Text('Login')),
                              ),
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1.0),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/eyechartlogin2.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
