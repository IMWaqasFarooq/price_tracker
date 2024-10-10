
import 'package:flutter/material.dart';


 navigateAndRemoveUntil({required BuildContext context ,required Widget widget}){

  return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => widget
      ),
        (Route<dynamic> route) => false,
  );
}

navigateAndReplace({required BuildContext context ,required Widget widget}){

  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => widget
    ),
  );
}



Future<T?> navigateAndPush<T>({required BuildContext context, required Widget widget}) {
  return Navigator.push<T>(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
