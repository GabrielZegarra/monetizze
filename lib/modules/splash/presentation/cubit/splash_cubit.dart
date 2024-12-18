import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/utils/constants/app_routes.dart';
import '../../../../shared/utils/states/global_state.dart';

class SplashCubit extends Cubit<GlobalState>{
  SplashCubit() : super(InitialState());

  Future<void> goToWelcomePage() async {
 Future.delayed(const Duration(seconds: 2), () {
      Modular.to.navigate(AppRoutes.home);
    });
  }
}