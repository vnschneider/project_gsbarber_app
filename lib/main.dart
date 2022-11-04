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

  ColorScheme defaultColorScheme = const ColorScheme(
    primary: Color.fromARGB(255, 26, 35, 126),
    secondary: Color.fromARGB(255, 26, 35, 126),
    surface: Color(0xff181818),
    background: Color.fromARGB(255, 255, 255, 255),
    error: Color.fromARGB(255, 242, 100, 48),
    onPrimary: Color.fromARGB(255, 255, 253, 237),
    onSecondary: Color(0xff000000),
    onSurface: Color.fromARGB(255, 52, 49, 45),
    onBackground: Color.fromARGB(255, 255, 255, 255),
    onError: Color(0xff000000),
    brightness: Brightness.light,
  );

  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      colorScheme: defaultColorScheme,
      //primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AuthProviderService.instance.user != null ? HomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
    builder: EasyLoading.init(),
  ));
}
