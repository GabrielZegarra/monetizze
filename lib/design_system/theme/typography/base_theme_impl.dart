import 'package:flutter/material.dart';

import 'ds_theme.dart';
import 'ds_typography.dart';
import 'ds_typography_impl.dart';
import 'i_base_theme.dart';

final class BaseThemeImpl implements IBaseTheme {
  @override
  DSTheme get dsTheme => throw DSTheme();

  @override
  ThemeData get themeData => DSTheme.theme;

  @override
  DSTypography get typography => DSTypographyImpl();


}
