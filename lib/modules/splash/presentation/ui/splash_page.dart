import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/design_system.dart';
import '../../../../shared/utils/constants/images_string.dart';
import '../../../../shared/utils/states/global_state.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit splashCubit;

  @override
  void initState() {
    super.initState();
    splashCubit = Modular.get<SplashCubit>();
    splashCubit.goToWelcomePage();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SplashCubit,GlobalState>(
      bloc: splashCubit,
      builder: (context,state) {
        return Scaffold(
          backgroundColor: DSColors.primary,
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: const Center(
              child: Text('ola'),
            ),
          ),
        );
      },
    );
  }
}
