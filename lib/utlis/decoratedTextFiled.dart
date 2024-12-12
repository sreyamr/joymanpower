import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget decoratedTextField({required String labelText}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none, // Removes the default underline
      ),
    ),
  );
}
