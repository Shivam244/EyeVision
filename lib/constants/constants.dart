import 'dart:ffi';

import 'package:flutter/material.dart';

var backgroundColour = const Color.fromRGBO(79, 96, 97, 100);

// 1ft = 1.74mm
// 6ft  60mm = 60 * 3.7795275591 * 0.846;

double MM_60 = 17.4;
double MM_48 = 14;
double MM_38 = 11.3;
double MM_36 = 10.48;
double MM_30 = 8.78;
double MM_24 = 6.98;
double MM_19 = 5.4;
double MM_18 = 5.24;
double MM_15 = 4.36;
double MM_12 = 3.5;
double MM_9_5 = 2.64;
double MM_9 = 2.62;
double MM_7_5 = 2.4;
double MM_6 = 1.74;
double MM_5 = 1.45;

// font constants
getConstant(String font, double fontSize) {
  if (font == 'Tamil') {
    return fontSize + 14;
  } else if (font == 'Telugu') {
    return fontSize + 4;
  } else if (font == 'Arabic') {
    return fontSize - 4;
  } else if (font == 'Assamese') {
    return fontSize + 8;
  } else if (font == 'Bengali') {
    return fontSize - 4;
  } else if (font == 'Kannada') {
    return fontSize + 22;
  } else if (font == 'Malayalam') {
    return fontSize + 16;
  } else if (font == 'Oriya') {
    return fontSize + 6;
  } else if (font == 'Punjabi') {
    return fontSize + 6;
  } else if (font == 'Urdu') {
    return fontSize + 16;
  } else {
    return fontSize;
  }
}

//Contact details

String phoneNumber = '+91 1234567890';
