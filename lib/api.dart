import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:mikenson_thomas/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  
  Future<List<Map<String, dynamic>>> pegarComentarioAleatorio() async {

    List<Map<String, dynamic>> lista = [];

    int id = Random().nextInt(100);

    //Aqui vai o link do API
    var url = Uri.parse('https://63824ac89842ca8d3ca5eba2.mockapi.io/api/v1/comentarios/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      lista.add(jsonDecode(utf8.decode(response.bodyBytes)));
      return lista;
    } else {
      throw Exception('Erro ao carregar dados do servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
          future: pegarComentarioAleatorio(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar os comentários'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          NetworkImage(snapshot.data![index]['avatar']),
                    ),
                    title: Text(snapshot.data![index]['name']),
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
  }
}

class MyHttpOverrides extends HttpOverrides{

  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        // final isValidHost = ["https://63824ac89842ca8d3ca5eba2.mockapi.io"].contains(host); // <-- allow only hosts in array
        // return isValidHost;
         return true;
      });
  }
}