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
    return fontSize + 90;
  } else if (font == 'Telugu') {
    return fontSize + 72;
  } else if (font == 'Arabic') {
    return fontSize + 32;
  } else if (font == 'Assamese') {
    return fontSize + 46;
  } else if (font == 'Bengali') {
    return fontSize + 46;
  } else if (font == 'Kannada') {
    return fontSize + 90;
  } else if (font == 'Malayalam') {
    return fontSize + 90;
  } else if (font == 'Oriya') {
    return fontSize + 52;
  } else if (font == 'Punjabi') {
    return fontSize + 48;
  } else if (font == 'Urdu') {
    return fontSize + 46;
  } else if (font == 'Gujrati') {
    return fontSize + 52;
  } else if (font == 'Hindi') {
    return fontSize + 52;
  } else if (font == 'Nepali') {
    return fontSize + 72;
  } else {
    return fontSize;
  }
}

getConstantWithDistance(String font, double fontSize, String distance) {
  if (font == 'Tamil') {
    if (distance == '6/60') {
      return fontSize + 85;
    } else if (distance == '6/36') {
      return fontSize + 50;
    } else if (distance == '6/24') {
      return fontSize + 32;
    } else if (distance == '6/18') {
      return fontSize + 22;
    } else if (distance == '6/12') {
      return fontSize + 14;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Telugu') {
    if (distance == '6/60') {
      return fontSize + 69;
    } else if (distance == '6/36') {
      return fontSize + 40;
    } else if (distance == '6/24') {
      return fontSize + 30;
    } else if (distance == '6/18') {
      return fontSize + 21;
    } else if (distance == '6/12') {
      return fontSize + 13;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Arabic') {
    if (distance == '6/60') {
      return fontSize + 32;
    } else if (distance == '6/36') {
      return fontSize + 21;
    } else if (distance == '6/24') {
      return fontSize + 14;
    } else if (distance == '6/18') {
      return fontSize + 10;
    } else if (distance == '6/12') {
      return fontSize + 6;
    } else if (distance == '6/6') {
      return fontSize + 2;
    } else {
      return fontSize;
    }
  } else if (font == 'Assamese') {
    if (distance == '6/60') {
      return fontSize + 46;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 24;
    } else if (distance == '6/18') {
      return fontSize + 18;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Bengali') {
    if (distance == '6/60') {
      return fontSize + 46;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 24;
    } else if (distance == '6/18') {
      return fontSize + 18;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Kannada') {
    if (distance == '6/60') {
      return fontSize + 90;
    } else if (distance == '6/36') {
      return fontSize + 55;
    } else if (distance == '6/24') {
      return fontSize + 32;
    } else if (distance == '6/18') {
      return fontSize + 24;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Malayalam') {
    if (distance == '6/60') {
      return fontSize + 90;
    } else if (distance == '6/36') {
      return fontSize + 55;
    } else if (distance == '6/24') {
      return fontSize + 32;
    } else if (distance == '6/18') {
      return fontSize + 24;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Oriya') {
    if (distance == '6/60') {
      return fontSize + 52;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 26;
    } else if (distance == '6/18') {
      return fontSize + 19;
    } else if (distance == '6/12') {
      return fontSize + 11;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Punjabi') {
    if (distance == '6/60') {
      return fontSize + 46;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 24;
    } else if (distance == '6/18') {
      return fontSize + 18;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Urdu') {
    if (distance == '6/60') {
      return fontSize + 46;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 24;
    } else if (distance == '6/18') {
      return fontSize + 18;
    } else if (distance == '6/12') {
      return fontSize + 12;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Gujrati') {
    if (distance == '6/60') {
      return fontSize + 52;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 26;
    } else if (distance == '6/18') {
      return fontSize + 19;
    } else if (distance == '6/12') {
      return fontSize + 11;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Hindi') {
    if (distance == '6/60') {
      return fontSize + 52;
    } else if (distance == '6/36') {
      return fontSize + 35;
    } else if (distance == '6/24') {
      return fontSize + 26;
    } else if (distance == '6/18') {
      return fontSize + 19;
    } else if (distance == '6/12') {
      return fontSize + 11;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else if (font == 'Nepali') {
    if (distance == '6/60') {
      return fontSize + 69;
    } else if (distance == '6/36') {
      return fontSize + 40;
    } else if (distance == '6/24') {
      return fontSize + 30;
    } else if (distance == '6/18') {
      return fontSize + 21;
    } else if (distance == '6/12') {
      return fontSize + 13;
    } else if (distance == '6/6') {
      return fontSize + 6;
    } else {
      return fontSize;
    }
  } else {
    return fontSize;
  }
}

//Contact details
String phoneNumber = '+91 1234567890';
String email = 'test@gmail.com';
String address = '111 Kolar, Bhopal, MP';
