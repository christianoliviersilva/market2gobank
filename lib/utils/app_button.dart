import 'package:flutter/material.dart';

Widget elevationButton(void Function()? onPressed, String textAdd) {
  return ElevatedButton(
    style:  ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey,
    minimumSize: const Size(20, 20),
  shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50))
  ),
    onPressed: onPressed,
    child: Text(textAdd, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
  );
}