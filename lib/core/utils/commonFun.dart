import 'package:flutter/material.dart';

Future<dynamic> openScreenAndReturnValue(BuildContext context, Widget widget) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void openScreenWithoutBack(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
  );
}