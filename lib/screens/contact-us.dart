import 'dart:convert';
import 'dart:io';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../main.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _LoginPageState();
}

class _LoginPageState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "";
  String password = "";
  bool formValid = true;
  bool initialFocus = true;
  String login = 'false';
  String deviceId = '';
  String encodedPassword = '';
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
    initialFocus = false;
    FocusScope.of(context).requestFocus(node);
    setState(() {});
  }

  checkLoggedIn() {
    Helper.getData('distance').then((value) => {
          if (value == null || value == '') {Helper.setData('distance', '5')}
        });
    Helper.getData('login').then((value) => {
          if (value == 'true') {Navigator.pushNamed(context, "/menu")}
        });
  }

  void _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.id;
    String encodedId = base64.encode(utf8.encode(deviceId));
    encodedPassword = encodedId.substring(0, 8);
    print(encodedPassword);
    setState(() {});
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('distance', value);
  }

  @override
  void initState() {
    _getId();
    print("Device id is: $deviceId");
    super.initState();
  }

  submitForm() {
    // if (username == 'admin' && password == '1234') {
    //   formValid = true;
    //   Navigator.pushNamed(context, "/menu");
    //   Helper.setData('login', 'true');
    // }
    if (password == encodedPassword) {
      formValid = true;
      Navigator.pushNamed(context, "/menu");
      Helper.setData('login', 'true');
    } else {
      formValid = false;
      submitButtonFocus.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Incorrect Password! Please contact your system admin')));
      FocusScope.of(context).requestFocus(passwordFocus);
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
    // if (initialFocus) {
    //   FocusScope.of(context).requestFocus(passwordFocus);
    // }
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
            child: Container(
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
                            // Actions(
                            //   actions: <Type, Action<Intent>>{
                            //     DownButtonIntent:
                            //         CallbackAction<DownButtonIntent>(
                            //             onInvoke: (intent) => changeFocus(
                            //                 context, passwordFocus!)),
                            //   },
                            //   // child: Focus(
                            //   // focusNode: userNameFocus,
                            //   child: Container(
                            //     // decoration: !(userNameFocus?.hasFocus ?? false)
                            //     //     ? null
                            //     //     : const BoxDecoration(
                            //     //         color: Color.fromARGB(55, 255, 255, 255),
                            //     //         borderRadius:
                            //     //             BorderRadius.all(Radius.circular(5))),
                            //     width: 350,
                            //     child: TextFormField(
                            //       controller: usernameController,
                            //       onChanged: (value) => {username = value},
                            //       focusNode: userNameFocus,
                            //       autofocus: true,
                            //       textInputAction: TextInputAction.next,
                            //       onFieldSubmitted: (value) {
                            //         userNameFocus.unfocus();
                            //         changeFocus(context, passwordFocus);
                            //       },
                            //       style: const TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.w300),
                            //       decoration: const InputDecoration(
                            //         hintText: 'Enter Username',
                            //         hintStyle: TextStyle(color: Colors.white),
                            //         labelText: 'Username',
                            //         labelStyle: TextStyle(color: Colors.white),
                            //         focusColor: Colors.blueGrey,
                            //         focusedBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color: Color.fromARGB(
                            //                     117, 255, 255, 255))),
                            //         enabledBorder: UnderlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.white),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   // ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Container(
                                  child: const Text(
                                    'DEVICE ID:    ',
                                    style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    deviceId,
                                    style: const TextStyle(
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 40,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'CONTACT US',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(phoneNumber,
                                    style: const TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))
                              ],
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
