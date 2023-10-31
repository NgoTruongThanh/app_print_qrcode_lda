import 'package:flutter/material.dart';
Widget getLabelLandValue(String label, String value,
    {Color titleColor = Colors.black54,
      Color valueColor = Colors.black,
      double fontSize = 15}) {
  return Container(
    padding: const EdgeInsets.only(right: 10, bottom: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(color: titleColor, fontSize: fontSize),
          ),
        ),
        Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                value,
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: valueColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
      ],
    ),
  );
}