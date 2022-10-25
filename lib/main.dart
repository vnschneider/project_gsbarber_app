//comentarii irrisorio 2
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'ui/login&register/loginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.indigo[900],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
    builder: EasyLoading.init(),
  ));
}
