import 'package:flutter/material.dart';
import 'package:app_finanzas_bakapp/static.dart' as Static;

SnackBar deleteInfoSnackBar = SnackBar(
  backgroundColor: Static.PrimaryColor,
  duration: Duration(
    seconds: 2,
  ),
  content: Row(
    children: [
      Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      SizedBox(
        width: 6.0,
      ),
      Text(
        "Manten pulsado para eliminar",
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    ],
  ),
);
