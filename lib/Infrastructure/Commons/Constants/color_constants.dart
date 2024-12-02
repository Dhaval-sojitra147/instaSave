import 'package:flutter/material.dart';

class ColorConstants {

  static const Color primary = Color(0xFFF8A8FE);

  static const Color orange = Color(0xFFFE9254);
  static const Color purple = Color(0xFFC079FA);
  static const Color checkBox = Color(0xFFC17AFB);//#C17AFB #F8A7FE
  static const Color purple2 = const Color.fromARGB(255, 192, 121, 250);
  //192, 121, 250
  static const Color appBar = Color.fromARGB(255, 5, 7, 13);

  static const Color transparent = Color(0x00000000);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color background = Color(0xFF1E1E1E);


  static const Color textColor = Color(0xFF111827);
  static const Color grey48B = Color(0xFF64748B);
  static const Color grey5E1 = Color(0xFFCBD5E1);
  static const Color grey900 = Color(0xFF171717);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey400 = Color(0xFFA3A3A3);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey200 = Color(0xFFE5E5E5);

  static  List<Color> linearGradientBorder=[
    const Color.fromARGB(255, 50, 48, 89),
    const Color.fromARGB(255, 40, 41, 61),
  ];
  static  List<Color> linearGradientButton=[
    const Color.fromARGB(255, 248, 167, 254),
    const Color.fromARGB(255, 193, 122, 251),
  ];
  static  List<Color> downloadBackCard=[
    const Color.fromARGB(255, 104, 98, 176,).withOpacity(.8),
    const Color.fromARGB(255, 172, 87, 164).withOpacity(.8),
    //rgba(104, 98, 176, 0.8)
    // rgba(172, 87, 164, 0.8)
  ];
  static  List<Color> lightAttributeMark=[
    const Color.fromARGB(255, 239, 140, 81,),
    const Color.fromARGB(255, 158, 36, 255,),
  ];
  static  List<Color> linearGradientDeleteButton=[
    const Color.fromARGB(255, 245, 109, 255),
    const Color.fromARGB(255, 158, 36, 255),
  ];
  static  List<Color> linearGradientDownloadButton=[
    const Color.fromARGB(255, 254, 146, 84,).withOpacity(.26),
    const Color.fromARGB(255, 254, 146, 84).withOpacity(0),
  ];
  static  List<Color> linearGradientNavigationButton=[
    const Color(0xFFFFFFFF).withOpacity(0.1),
    const Color(0xFFFFFFFF).withOpacity(0.3),
    const Color(0xFFFFFFFF).withOpacity(0.2),
  ];
  static  Color bottomBarBorder=const Color.fromARGB(255, 50, 48, 89);
  static  Color borderColor=const Color.fromARGB(255, 50, 48, 89);
  static  Color searchBar=const Color.fromARGB(255, 50, 48, 89);
  static  Color caption=const Color.fromARGB(255, 23, 25, 31,);
  static  Color cardBackGroundColor=const Color.fromARGB(255, 19, 22, 32);
  static  Color bottomBarColor=const Color(0x00020224);

  static const Color errorRed = Color(0xFFEF4444);

}
