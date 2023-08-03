import 'package:app_admin_ponto_certo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

Future<void> main() async {
  // Iniciar os Widgets
  WidgetsFlutterBinding.ensureInitialized();

  // Iniciar o firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
