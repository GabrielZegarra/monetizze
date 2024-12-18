import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/cubit/splash_cubit.dart';
import 'presentation/ui/splash_page.dart';

class SplashModule extends Module {
  SplashModule();

  @override
  void binds(i) {
    i.add<SplashCubit>(SplashCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
    );
  }
}
