import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mikenson_thomas/about.dart';
import 'package:mikenson_thomas/api.dart';
import 'login.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker imagePicker = ImagePicker();

  XFile? imagemSelecionada;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Imagem')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          imagemSelecionada == null
              ? Container()
              :Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.file(
                                File(imagemSelecionada!.path),
                                fit: BoxFit.contain,
                                height: 200,
                              )),
                  ),
                  Expanded(child: Api())
              ],
            ),
          ),
        )

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () => pegaImagemGareria(),
                icon: const Icon(Icons.add_photo_alternate_outlined)),
            IconButton(
                onPressed: () => pegaImagemCamera(),
                icon: const Icon(Icons.photo_camera_outlined)),
          ],
        ),
      ),
    );
  }

  // IconButton(
  //   onPressed: () {
  //     pegaImagemGareria();
  //   },
  //   icon: const Icon(Icons.add_photo_alternate_outlined),
  // ),
  // IconButton(
  //   onPressed: () {
  //     pegaImagemCamera();
  //   },
  //   icon: const Icon(Icons.photo_camera_outlined),
  // ),

  pegaImagemGareria() async {
    //final PickedFile? imagemTemporaria = await imagePicker.getImage(source: ImageSource.gallery);
    final XFile? imagemTemporaria =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = imagemTemporaria;
      });
    }
  }

  pegaImagemCamera() async {
    //final PickedFile? imagemTemporaria = await imagePicker.getImage(source: ImageSource.camera);
    final XFile? imagemTemporaria =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (imagemTemporaria != null) {
      setState(() {
        imagemSelecionada = imagemTemporaria;
      });
    }
  }
}
