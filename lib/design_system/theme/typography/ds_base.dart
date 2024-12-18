import 'package:flutter/material.dart';

import 'ds_typography.dart';
import 'i_base_theme.dart';

final class DSBase{
  final IBaseTheme _theme;
  static DSBase? _singleton;
  DSBase._( this._theme);

  factory DSBase.init({required IBaseTheme theme}) {
    _singleton ??=  DSBase._(theme);
    return _singleton!;
  }

  ThemeData get themeData => _singleton!._theme.themeData;
  static DSTypography get typography => _singleton!._theme.typography;
}