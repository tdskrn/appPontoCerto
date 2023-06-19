import 'package:cotacao_ponto_certo/app/presentation/modules/login/views/login_view_screen.dart';
import 'package:cotacao_ponto_certo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

import '../modules/home/views/home_screen_view.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.login: (context) => LoginScreenView(),
    Routes.home: (context) => HomeScreenView()
  };
}
