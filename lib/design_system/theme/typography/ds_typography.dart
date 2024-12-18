import 'ds_text_style.dart';

interface class DSTypography {
  final DSTextStyle h2;
  final DSTextStyle hint;
  final DSTextStyle titleButton;
  final DSTextStyle h1;
  final DSTextStyle bodyText;
  final DSTextStyle h3;

  const DSTypography({
    required this.h2,
    required this.hint,
    required this.titleButton,
    required this.h1,
    required this.bodyText,
    required this.h3,
  });
}