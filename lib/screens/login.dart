import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:eyevision/bricks/Widgets%20Example/gradient_blue_to_dark_blue.dart';
import 'package:eyevision/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import '../constants/constants.dart';
import '../main.dart';
import 'package:flutter/services.dart';

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
  bool initialFocus = true;
  String login = 'false';
  String deviceId = '';
  String encodedPassword = '';
  final Random _rnd = Random();
  final String _chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
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

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<String?> getAndroidId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.id;
  }

  Future<String> getSecureAndroidId() async {
    const channel = MethodChannel('my_channel');
    try {
      final String? androidId8 =
          await channel.invokeMethod<String>('getAndroidId');
      return androidId8 ?? '00000000';
    } on PlatformException {
      return '00000000';
    }
  }

  void _getId() async {
    // var deviceInfo = DeviceInfoPlugin();
    // var androidDeviceInfo = await deviceInfo.androidInfo;
    await Helper.getData('deviceId').then((value) async {
      if (value == '' || value == null) {
        final unique8Chars = await getSecureAndroidId();
        deviceId = unique8Chars; // or just unique8Chars
        await Helper.setData('deviceId', deviceId);
      } else {
        deviceId = value;
      }
    });

    print(deviceId);
    // String encodedId = base64.encode(utf8.encode(deviceId));
    // encodedPassword = encodedId.substring(0, 8);
    encodedPassword = encryptUniqueID(deviceId);
    print("password: " + encodedPassword);
    setState(() {});
  }

  String encryptUniqueID(String uniqueID) {
    try {
      // 1) Compute SHA-256 digest (32 bytes)
      final bytes = utf8.encode(uniqueID);
      final digest =
          sha256.convert(bytes).bytes; // List<int> of length 32 (0..255)

      // 2) In Kotlin, each byte is signed (-128..127).
      //    We must simulate that here by converting any byte >= 128 to a negative value.
      //    Then fold into a 32-bit accumulator with overflow.
      int acc = 0;
      for (final unsignedByte in digest) {
        final signedByte = unsignedByte & 0x80;
        // If the top bit is set, interpret as negative in Kotlin:
        // Example: 0xF8 (248) becomes -8, etc.
        final b = (signedByte != 0)
            ? (unsignedByte - 256) // interpret as negative
            : unsignedByte; // keep as is if < 128

        // Kotlin's (acc * 31 + byte) on a 32-bit int with overflow
        acc = (acc * 31 + b) & 0xFFFFFFFF;
      }

      // 3) Now interpret acc as *signed* 32-bit, then take absolute value.
      //    If the sign bit is set, it's negative in 32-bit arithmetic.
      if ((acc & 0x80000000) != 0) {
        // Convert 32-bit two's complement to negative Dart int
        acc = -((acc ^ 0xFFFFFFFF) + 1);
      }
      acc = acc.abs();

      // 4) Convert to string and take up to 8 digits. Pad if fewer than 8.
      final strValue = acc.toString();
      final activationKey = (strValue.length >= 8)
          ? strValue.substring(0, 8)
          : strValue.padLeft(8, '0');

      return activationKey;
    } catch (e) {
      // Fallback in case of error
      return '00000000';
    }
  }

  setData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('distance', value);
  }

  @override
  void initState() {
    // ServicesBinding.instance.keyboard.addHandler(_onKey);
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
                // Provide a child so it can fill the entire area if needed
                child: const SizedBox.expand(),
              ),

              /// 2) The background image overlaid on top of the gradient
              ///    Using a light colorFilter so the gradient remains visible.
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

              /// 3) The main content (logo, title, form) in the center
              Shortcuts(
                shortcuts: <LogicalKeySet, Intent>{
                  LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
                  LogicalKeySet(LogicalKeyboardKey.arrowUp): UpButtonIntent(),
                  LogicalKeySet(LogicalKeyboardKey.arrowDown): DownButtonIntent(),
                  LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftButtonIntent(),
                  LogicalKeySet(LogicalKeyboardKey.arrowRight): RightButtonIntent(),
                  LogicalKeySet(LogicalKeyboardKey.goBack): AbortButtonIntent(),
                },
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Top Row: Logo + Title
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Image.asset(
                                'assets/images/logo.jpeg',
                                height: 50,
                              ),
                            ),
                            Text(
                              'ACUITY VISION CHART',
                              style: GoogleFonts.bebasNeue(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Device ID
                        Text(
                          'DEVICE ID: ${deviceId.toUpperCase()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// The Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              /// Password Field
                              Actions(
                                actions: <Type, Action<Intent>>{
                                  DownButtonIntent:
                                      CallbackAction<DownButtonIntent>(
                                    onInvoke: (intent) => changeFocus(
                                      context,
                                      submitButtonFocus,
                                    ),
                                  ),
                                },
                                child: SizedBox(
                                  width: 350,
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    focusNode: passwordFocus,
                                    autofocus: true,
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    onFieldSubmitted: (value) {
                                      passwordFocus.unfocus();
                                      changeFocus(context, submitButtonFocus);
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(color: Colors.white),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              118, 255, 255, 255),
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              /// Submit Button
                              Actions(
                                actions: <Type, Action<Intent>>{
                                  EnterButtonIntent:
                                      CallbackAction<EnterButtonIntent>(
                                    onInvoke: (intent) => submitForm(),
                                  ),
                                  UpButtonIntent: CallbackAction<UpButtonIntent>(
                                    onInvoke: (intent) =>
                                        changeFocus(context, passwordFocus),
                                  ),
                                },
                                child: Container(
                                  decoration:
                                      !(submitButtonFocus.hasFocus)
                                          ? null
                                          : BoxDecoration(
                                              color: const Color.fromARGB(
                                                  40, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                  child: TextButton(
                                    focusNode: submitButtonFocus,
                                    onPressed: submitForm,
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: backgroundColour,
                                      shadowColor: Colors.black,
                                      elevation: 8,
                                      fixedSize: const Size(200, 40),
                                    ),
                                    child: const Text('LOGIN'),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
