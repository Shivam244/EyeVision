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
    await Helper.getData('deviceId').then((value) {
      if (value != '' && value != null) {
        // deviceId = getRandomString(6);
        deviceId = value;
      }
    });
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
  return Scaffold(
    backgroundColor: backgroundColour,
    body: Center(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width - 60,
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 15)],
          ),
          child: Stack(
            children: [
              /// 1) The animated gradient background
              AnimateGradient(
                primaryBegin: Alignment.topLeft,
                primaryEnd: Alignment.bottomLeft,
                secondaryBegin: Alignment.bottomLeft,
                secondaryEnd: Alignment.topRight,
                duration: const Duration(seconds: 10),
                primaryColors: [
                  backgroundColour,
                  Color.fromARGB(255, 2, 104, 189),
                  backgroundColour,
                ],
                secondaryColors: [
                  backgroundColour,
                  Color.fromARGB(255, 2, 104, 189),
                  backgroundColour,
                ],  
                child: const SizedBox.expand(),
              ),

              /// 2) The background image, lightly overlaid
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/eyechartlogin2.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.03),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
              ),

              /// 3) The main content in the center
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Top Row: Title
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Text(
                                'ACUITY VISION CHART',
                                style: GoogleFonts.bebasNeue(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Device ID Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'DEVICE ID: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              deviceId.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        /// Logo + Contact Info
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// Logo
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.asset(
                                'assets/images/logo.jpeg',
                                height: 70,
                              ),
                            ),
                            // If you want a "CONTACT US" heading, uncomment below:
                            // const Text(
                            //   'CONTACT US',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 30,
                            //       fontWeight: FontWeight.bold),
                            // ),

                            /// Address
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.pin_drop,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    address,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /// Email
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  email,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            /// Phone
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  phoneNumber,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}
