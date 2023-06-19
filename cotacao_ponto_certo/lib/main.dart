import 'package:cotacao_ponto_certo/app/data/repositories_implementation/firebase_login_repository_impl.dart';
import 'package:cotacao_ponto_certo/app/domain/repositories/firebase_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Precisa iniciar todos widgets
  WidgetsFlutterBinding.ensureInitialized();
  // inicializar o firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Injector(
      firebaseLoginRepository: FirebaseLoginRepositoryImpl(
        FirebaseAuth.instance,
      ),
      child: const MyApp()));
}

class Injector extends InheritedWidget {
  const Injector(
      {super.key, required super.child, required this.firebaseLoginRepository
      //! Aqui eu passo os repositories
      });
  // final repository _repository;
  final FirebaseLoginRepository firebaseLoginRepository;

  @override
  bool updateShouldNotify(_) {
    return false;
  }

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
