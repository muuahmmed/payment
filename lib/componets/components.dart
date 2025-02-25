import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);
Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTab,
  bool isPasssword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) {
  return TextFormField(

    controller: controller,
    keyboardType: type,
    obscureText: isPasssword,
    enabled: isClickable,

    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black), // Ensure label text is visible
      prefixIcon: Icon(prefix, color: Colors.black), // Ensure icon color is visible
      suffixIcon: suffix != null
          ? IconButton(
        icon: Icon(suffix, color: Colors.black),
        onPressed: () {
          if (suffixPressed != null) {
            suffixPressed();
          }
        },
      )
          : null,
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
    ),
    onFieldSubmitted: (value) {
      if (onSubmit != null) {
        onSubmit(value);
      }
    },
    onChanged: (value) {
      if (onChange != null) {
        onChange(value);
      }
    },
    onTap: () {
      if (onTab != null) {
        onTab();
      }
    },
    validator: (value) {
      return validate(value);
    },
    style: const TextStyle(color: Colors.black), // Ensure input text is visible
  );
}

void showToast({
  required text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.amber;
  }
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) {
    print(match.group(0));
  });
}
