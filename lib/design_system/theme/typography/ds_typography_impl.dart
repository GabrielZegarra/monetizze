import 'package:flutter/material.dart';

import '../constants/ds_const_color.dart';
import 'ds_text_style.dart';
import 'ds_typography.dart';

 class DSTypographyImpl implements DSTypography {

   //height "normal" is 1.5

  @override
  DSTextStyle get hint => DSTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: DSColors.secondary,
    height: 1.5,
  );

  @override
  DSTextStyle get titleButton => DSTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: DSColors.primary,
    height: 1.5,
  );

  @override
  DSTextStyle get h1 => DSTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: DSColors.primary,
    height: 1.1,
  );

  @override
  DSTextStyle get h2 => DSTextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: DSColors.primary,
    height: 1.5,
  );

  @override
  DSTextStyle get h3 => DSTextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: DSColors.primary,
    height: 1.5,
  );

  @override
  DSTextStyle get bodyText => DSTextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: DSColors.secondary,
    height: 1.5,
  );

 }