import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../services/auth_provider_services.dart';
import '../menuPages/homePage.dart';
import '../widgets/app_outlinedbutton.dart';
import '../widgets/app_textfield.dart';
import 'registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TapGestureRecognizer registerOnTap = TapGestureRecognizer();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> signInEmail() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void initState() {
    registerOnTap = TapGestureRecognizer();
    registerOnTap
      ..onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RegisterPage(),
            ));
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //surfaceTintColor: Colors.black,
        //notificationPredicate: defaultScrollNotificationPredicate,
        //scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Image.asset(
                "assets/logogs4.png",
                height: 435,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    //SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira um email válido';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    /*AppTextField(
                      hint: "Email",
                      icon: Icons.email,
                      keyType: TextInputType.emailAddress,
                      helpOnTap: () {},
                      helpContent: Text(" "),
                    ),*/
                    SizedBox(height: 12),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira sua senha';
                        } else if (value.length < 6) {
                          return 'sua senha deve conter pelo menos 6 caracteres!';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              //showpassword = false;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    /*AppTextField(
                      hint: "Senha",
                      icon: Icons.lock,
                      keyType: TextInputType.visiblePassword,
                      helpContent: Text(
                        "Esqueceu?",
                        style:
                            TextStyle(fontSize: 16, color: Colors.indigo[900]),
                      ),
                      helpOnTap: () {},
                    ),*/
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo[900]),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(16)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              )),
                            ),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()));
                            },
                            /*onPressed: () {
                              AuthProviderService.instance.isLoading == true
                                  ? AuthProviderService.instance.loading()
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HomePage()));
                            },*/
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Ou faça login com...",
                      style: TextStyle(color: Colors.black38),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: AppOutlinedButton(
                            asset: "assets/googleicon.png",
                            onTap: () async {
                              await AuthProviderService.instance.signIn();
                              AuthProviderService.instance.loading();
                              if (AuthProviderService.instance.user != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AppOutlinedButton(
                            asset: "assets/appleicon.png",
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AppOutlinedButton(
                            asset: "assets/facebookicon.png",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text.rich(
                      TextSpan(
                        text: "Novo aqui? ",
                        children: [
                          TextSpan(
                            text: "Criar conta",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: registerOnTap,
                          ),
                        ],
                      ),
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
