import 'package:cotacao_ponto_certo/login/controllers/login_controller.dart';
import 'package:cotacao_ponto_certo/login/views/register_page.dart';
import 'package:flutter/material.dart';

import '../../main_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _login = LoginController();

  _loginUser() async {
    if (_formKey.currentState!.validate()) {
      String res = await _login.loginUsers(
          _emailController.text, _passwordController.text);
      if (res == 'success') {
        _formKey.currentState!.reset();
        return Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, email não deve ser vazio';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Insira seu email",
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
                      return 'Por favor a senha não pode ser vazia';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Entre com sua senha",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _loginUser();
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
                      'LOGIN',
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
                  Text("Não tem uma conta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text('Registre-se'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
