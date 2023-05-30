import 'package:cotacao_ponto_certo/login/controllers/login_controller.dart';
import 'package:cotacao_ponto_certo/login/views/login_page.dart';
import 'package:cotacao_ponto_certo/models/entitys/user.dart';
import 'package:flutter/material.dart';

import '../../main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _login = LoginController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _registerUsers() async {
    if (_formKey.currentState!.validate()) {
      UserApp _user = UserApp(
          fullName: _fullNameController.text,
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          password: _passwordController.text);

      String res = await _login.signUpUsers(_user);

      if (res == 'success') {
        _formKey.currentState!.reset();
        return Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ));
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login \n App Cotação Ponto Certo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _fullNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor nome não pode ser vazio';
                      } else {
                        return null;
                      }
                    },
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                      labelText: "Insira seu nome completo",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, email não deve ser vazio';
                      } else {
                        return null;
                      }
                    },
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                      labelText: "Insira seu email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira seu telefone';
                      } else {
                        return null;
                      }
                    },
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                      labelText: "Telefone",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, senha não pode ser vazia';
                      } else {
                        return null;
                      }
                    },
                    onChanged: ((value) {}),
                    decoration: InputDecoration(
                      labelText: "Insira sua senha",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _registerUsers();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'REGISTRE-SE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Já tem uma conta?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Faça Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
