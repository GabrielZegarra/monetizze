import 'package:flutter/material.dart';

import 'ds_theme.dart';
import 'ds_typography.dart';

interface class IBaseTheme{
 final DSTheme dsTheme;
 final DSTypography typography;
 final ThemeData themeData;

  IBaseTheme({required this.dsTheme, required this.typography, required this.themeData});
}