import 'package:cotacao_ponto_certo/app/presentation/routes/app_routes.dart';
import 'package:cotacao_ponto_certo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.login,
        routes: appRoutes,
      ),
    );
  }
}
