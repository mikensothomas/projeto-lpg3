// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mikenson_thomas/splash.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite/sqlite_api.dart';

void main() async {   
  WidgetsFlutterBinding.ensureInitialized();
  //await HiveConfig.start();
  //await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}
