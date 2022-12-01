// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mikenson_thomas/api.dart';
import 'package:mikenson_thomas/splash.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite/sqlite_api.dart';

void main() async {   
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}
