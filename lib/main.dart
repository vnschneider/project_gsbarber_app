//comentario irrisorio 2
import 'package:firebase_core/firebase_core.dart';
import 'package:project_gsbarber_app/services/auth_provider_services.dart';
import 'package:project_gsbarber_app/ui/menuPages/homePage.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'ui/login&register/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.indigo[900],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AuthProviderService.instance.user != null ? HomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
    builder: EasyLoading.init(),
  ));
}
