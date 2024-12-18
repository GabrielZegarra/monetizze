import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../design_system/design_system.dart';
import '../shared/utils/constants/app_strings.dart';
import 'app_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return ModularApp(
      module: AppModule(),
      child:  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        routerDelegate: Modular.routerDelegate,
        theme: DSBase.init(theme: BaseThemeImpl()).themeData,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
