import 'dart:ui';
import 'package:flutter/material.dart';

class AppCol {
  static Color whiteA7007f = fromHex('#7fffffff');
  // static Color primary = Color(0xFF3371A5);
    static Color primary = fromHex('#004aad');
  static Color lightestgrey = Color(0xFFF3F3F3);
  static Color bgColor = Color(0xFFF0F1F6);
  // static Color buttonBackgroundColor = fromHex('#004aad');
  static Color gray600Cc = fromHex('#cc787878');

  static Color deepOrangeA7007f01 = fromHex('#7ffd1111');

  static Color red600 = fromHex('#eb3226');

  static Color lightBlue100 = fromHex('#b8e6ff');

  static Color lightGreenA700 = fromHex('#89cc1d');

  static Color lightGreen200 = fromHex('#bbdab9');

  static Color lightBlue50000 = fromHex('#0000a1ff');

  static Color lightBlue500 = fromHex('#00a1ff');

  static Color blue30001 = fromHex('#58adde');

  static Color red400 = fromHex('#e26161');

  static Color lightGreen400 = fromHex('#a1e261');

  static Color indigo20000 = fromHex('#008a9cde');

  static Color lightBlue50001 = fromHex('#15ace5');

  static Color black9003f = fromHex('#3f000000');

  static Color lightGreenA70033 = fromHex('#3389cc1d');

  static Color yellowA200 = fromHex('#fffc00');

  static Color black90000 = fromHex('#00000000');

  static Color deepOrange300 = fromHex('#e29761');

  static Color yellowA2001c = fromHex('#1cfffc00');

  static Color lightBlue5007f = fromHex('#7f00a1ff');

  static Color red6000001 = fromHex('#00da452a');

  static Color blueGray90000 = fromHex('#0007283c');

  static Color blueGray900 = fromHex('#333333');

  static Color cyan20000 = fromHex('#008acede');

  static Color purpleA4007f01 = fromHex('#7fdd11fe');

  static Color gray600 = fromHex('#787878');

  static Color lightGreenA4007f = fromHex('#7f6bfe10');

  static Color lime500 = fromHex('#d7df23');

  static Color lightGreenA4007f01 = fromHex('#7f6bfe11');

  static Color gray800 = fromHex('#3f3f3f');

  static Color gray7007f = fromHex('#7f676767');

  static Color gray200 = fromHex('#e6e7e8');

  static Color lightGreen40001 = fromHex('#a3de58');

  static Color lime30000 = fromHex('#00ded08a');

  static Color indigo400 = fromHex('#585dde');

  static Color bluegray400 = fromHex('#888888');

  static Color green30000 = fromHex('#008ade8d');

  static Color yellowA7007f = fromHex('#7ffed810');

  static Color blue300 = fromHex('#61b3e2');

  static Color yellowA7007f01 = fromHex('#7ffed811');

  static Color blue100 = fromHex('#c9ecff');

  static Color red2000001 = fromHex('#00dead8a');

  static Color black90019 = fromHex('#19000000');

  static Color blueA7007f01 = fromHex('#7f1162fe');

  static Color red20000 = fromHex('#00de8a8a');

  static Color whiteA700 = fromHex('#ffffff');

  static Color whiteA7009e = fromHex('#9effffff');

  static Color gray70000 = fromHex('#00676767');

  static Color gray5007f = fromHex('#7fababab');

  static Color blueGray50 = fromHex('#f1f1f1');

  static Color gray5003a = fromHex('#3aababab');

  static Color lightBlue80000 = fromHex('#000083be');

  static Color indigoA200 = fromHex('#6176e2');

  static Color lightBlue50066 = fromHex('#6614ace5');

  static Color red500 = fromHex('#f44336');

  static Color red40001 = fromHex('#de5858');

  static Color blue6007f = fromHex('#7f1c93d2');

  static Color deepOrangeA40059 = fromHex('#59ff2800');

  static Color greenA200 = fromHex('#61e295');

  static Color gray50 = fromHex('#f9f9f9');

  static Color lightBlue800 = fromHex('#0083be');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color black900 = fromHex('#000000');

  static Color lightGreen500 = fromHex('#83de58');

  static Color gray50001 = fromHex('#a7a7a7');

  static Color indigo50000 = fromHex('#003270a5');

  static Color blue60044 = fromHex('#441c93d2');

  static Color blueA7007f = fromHex('#7f1061fe');

  static Color yellowA2003a = fromHex('#3afffc00');

  static Color deepOrangeA400 = fromHex('#ff2801');

  static Color gray60000 = fromHex('#007f7f7f');

  static Color gray700 = fromHex('#676767');

  static Color lime400 = fromHex('#e2dd61');

  static Color gray500 = fromHex('#ababab');

  static Color deepOrange30001 = fromHex('#de9858');

  static Color gray900 = fromHex('#1e1e1e');

  static Color gray90001 = fromHex('#202629');

  static Color deepOrangeA7007f = fromHex('#7ffe1111');

  static Color blue600 = fromHex('#1d93d2');

  static Color lime40001 = fromHex('#ded858');

  static Color blueGray9007f = fromHex('#7f333333');

  static Color red60000 = fromHex('#00eb3226');

  static Color tealA200 = fromHex('#61e2d2');

  static Color lightGreen90000 = fromHex('#0038550a');

  static Color lightBlue50051 = fromHex('#5114ace5');

  static Color gray6007f = fromHex('#7f787878');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color cyan300 = fromHex('#58dec5');

  static Color purpleA4007f = fromHex('#7fdc10fe');

  static Color teal20000 = fromHex('#008adece');

  static Color lightGreen30000 = fromHex('#00c3de8a');

  static Color blue200 = fromHex('#91d8ff');

  static Color indigo500 = fromHex('#3371a5');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
