import 'package:app_admin_ponto_certo/app/models/precos.dart';

class Produto {
  String? id;
  final String title;
  final List<Preco> precos;

  Produto(this.title, this.precos);
}
