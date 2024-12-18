import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/app_widget.dart';

void main() async{
  await initializeDateFormatting('pt_BR', null);
  runApp(const AppWidget());
}