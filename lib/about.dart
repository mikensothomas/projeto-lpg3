import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mikenson_thomas/homePage.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Sobre')),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/foto.jpeg'),
                ),
                Center(child: Text("NOME: Mikenson")),
                Center(child: Text("SOBRENOME: Thomas")),
                Center(child: Text("E_MAIL: mikensonthomas2@gmail.com")),
                const Text(
                      "Aplicativos criados no Flutter têm seus códigos compilados para a linguagem base de um sistema operacional. Isso significa que eles passam a ser nativos e, naturalmente, conseguem acessar recursos do dispositivo sem precisar de intermediários, oferecendo um desempenho melhor. Os apps também usam a mesma base de código. Este aplicativo é um aplicativo que permite que a gente pega foto usando a câmera do celular ou pega imagem na galeria do celular, mas antes de ter acesso às páginas você tem que cadastrar seus dados primeiro. Isso tem que ser feito cada vez que você precisa acessar às páginas."),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Volta'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      ((route) => false));
                },
                child: Text('Pega imagem'),
              ),
            ],
        ),
          ),
      ),
    );
  }
}

    