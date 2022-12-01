import 'package:flutter/material.dart';
import 'package:mikenson_thomas/cadastro.dart';
import 'package:mikenson_thomas/db/database_helper.dart';
import 'package:mikenson_thomas/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'acesso.dart';
import 'splash.dart';
import 'homePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    TextEditingController emailEditingController = TextEditingController(text: 'teste@teste.com');
    TextEditingController senhaEditingController = TextEditingController(text: '123456');

    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Pagina de login'),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Cadastro()));
                  },
                  child: Icon(
                    Icons.person_add,
                    size: 26.0,
                  ),
                )
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text('Ensere seus dados',
                          style: TextStyle(fontSize: 20)),
                    ),
                    
                    TextFormField(
                      controller: emailEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o campo email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'E_mail',
                          icon: Icon(Icons.email_outlined),
                          hintText: 'Informe o email'),
                    ),
                    TextFormField(
                      controller: senhaEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o campo senha';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: 'Senha',
                        icon: Icon(Icons.vpn_key_off_sharp),
                        hintText: 'Informe a senha',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String email = emailEditingController.text;
                            String senha = senhaEditingController.text;

                            var usuarioExiste = await DatabaseHelper.instance.login(email, senha);

                            if (usuarioExiste == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Usuário ou Senha Inválido!')),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AcessoPage(
                                    email: email,
                                  ),
                                ),
                              );
                            }
                            
                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Text('Pega uma imagem'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
