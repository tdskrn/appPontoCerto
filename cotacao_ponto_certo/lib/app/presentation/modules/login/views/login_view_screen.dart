import 'package:cotacao_ponto_certo/app/presentation/global/colors.dart';
import 'package:cotacao_ponto_certo/app/presentation/routes/routes.dart';
import 'package:cotacao_ponto_certo/main.dart';
import 'package:flutter/material.dart';

import '../../../global/animations/slide_animation.dart';

class LoginScreenView extends StatefulWidget {
  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  Future<String> logar() async {
    final response = await Injector.of(context)
        .firebaseLoginRepository
        .signInWithEmailAndPassword(
          _userController.text,
          _passwordController.text,
        );
    if (response.user!.uid.isNotEmpty) {
      return 'sucesso';
    } else {
      return 'fracasso';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsApp.blueApp,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                SlideAnimation(
                  position: 2,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: Text(
                    'Olá amigo \nSeja bem vindo!',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Sofia",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100]!,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Não pode ser vazio';
                              }
                              return null;
                            },
                            controller: _userController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Usuário",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[100]!,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Não pode ser vazio';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Senha",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SlideAnimation(
                    position: 1,
                    itemCount: 8,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(
                        color: ColorsApp.orangeApp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await logar();
                        if (response == 'sucesso') {
                          Navigator.pushReplacementNamed(context, Routes.home);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Deu ruim parceiro'),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsApp.orangeApp,
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: Center(
                    child: Text(
                      "Cria sua Conta",
                      style: TextStyle(
                        color: ColorsApp.orangeApp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
