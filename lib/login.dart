import 'package:flutter/material.dart';
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
    TextEditingController nomeEditingController = TextEditingController();
    TextEditingController sobrenomeEditingController = TextEditingController();
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController senhaEditingController = TextEditingController();

    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text('Pagina de login')),
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
                      controller: nomeEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o campo nome';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Nome',
                          icon: Icon(Icons.person),
                          hintText: 'Informe o nome'),
                    ),
                    TextFormField(
                      controller: sobrenomeEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Preencha o campo sobrenome';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelText: 'Sobrenome',
                          icon: Icon(Icons.person),
                          hintText: 'Informe o sobrenome'),
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
                            String nome = nomeEditingController.text;
                            String sobrenome = sobrenomeEditingController.text;
                            String email = emailEditingController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processando Dados')),
                            );

                            // // GRAVAR OS DADOS NO BANCO
                            // Map<String, String> usuario = {
                            //   DatabaseHelper.columnNome: nome,
                            //   DatabaseHelper.columnSobrenome: sobrenome,
                            //   DatabaseHelper.columnEmail: email,
                            // };

                            // final id = await DatabaseHelper.instance.insert(usuario);
                            // print(id);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcessoPage(
                                  nome: nome,
                                  sobrenome: sobrenome,
                                  email: email,
                                ),
                              ),
                            );
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
