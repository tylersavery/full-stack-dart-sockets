import 'package:flutter/material.dart';

int hexToInteger(String hex) => int.parse(hex.replaceAll("#", "FF"), radix: 16);

Color hexToColor(String hex) => Color(hexToInteger(hex));
