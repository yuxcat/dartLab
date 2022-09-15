import 'package:flutter/material.dart';

class AppStateModel {
  AppStateModel(this.current);

  static Brightness dark = Brightness.dark;
  static Brightness light = Brightness.light;
  Brightness current;
}
