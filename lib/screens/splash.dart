import 'package:eyevision/constants/constants.dart';
import 'package:flutter/material.dart';

import '../utils/helper.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  initState() {
    checkLoggedIn();
    super.initState();
  }

  checkLoggedIn() {
    Helper.containes('distance').then((value) => {
          if (!value) {Helper.setData('distance', '5')}
        });
    // Helper.getData('distance').then((value) => {
    //       if (value == null || value == '') {Helper.setData('distance', '5')}
    //     });
    Helper.getData('login').then((value) => {
          if (value == 'true')
            {Navigator.popAndPushNamed(context, "/menu")}
          else
            {Navigator.popAndPushNamed(context, "/login")}
        });
    Helper.containes('inversion').then((value) => {
          if (!value) {Helper.setData('inversion', 'Normal')}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      body: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
