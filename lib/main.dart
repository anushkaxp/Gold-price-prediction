
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gold_n/MyLogin.dart';
import 'package:gold_n/MyRegister.dart';
import 'package:gold_n/ResetPassword.dart';
import 'package:gold_n/Home.dart';
import 'package:gold_n/Profile.dart';
import 'package:gold_n/GoldPrice.dart';
import 'package:gold_n/SilverPrice.dart';
import 'package:gold_n/GoldStocks.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'Sign Up': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}