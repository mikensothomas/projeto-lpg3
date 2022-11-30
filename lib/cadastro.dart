import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mikenson_thomas/acesso.dart';
import 'package:mikenson_thomas/db/database_helper.dart';
import 'package:mikenson_thomas/homePage.dart';
import 'package:mikenson_thomas/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeEditingController = TextEditingController(text: 'Teste');
    TextEditingController sobrenomeEditingController = TextEditingController(text: 'Teste');
    TextEditingController emailEditingController = TextEditingController(text: 'teste@teste.com');
    TextEditingController senhaEditingController = TextEditingController(text: '123456');

    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Pagina de Cadastro'),
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
                            String senha = senhaEditingController.text;

                            // // GRAVAR OS DADOS NO BANCO
                            Map<String, dynamic> usuario = {
                              DatabaseHelper.columnNome: nome,
                              DatabaseHelper.columnSobrenome: sobrenome,
                              DatabaseHelper.columnEmail: email,
                              DatabaseHelper.columnSenha: senha,
                            };

                            final id = await DatabaseHelper.instance.insert(usuario);

                            if (id > 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login()
                                ),
                              );
                            }
                            
                          }
                        },
                        child: const Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}