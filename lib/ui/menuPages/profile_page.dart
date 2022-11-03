import 'package:flutter/material.dart';

import '../../services/auth_provider_services.dart';
import '../login&register/loginPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Perfil",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (AuthProviderService.instance.user == null)
                  Row(
                    children: [
                      Text(
                        "Faça o login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.login, color: Colors.indigo[900]),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                      )
                    ],
                  )
                else
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "${AuthProviderService.instance.user?.photoURL}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(width: 10),
                if (AuthProviderService.instance.user == null)
                  Text("")
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AuthProviderService.instance.user?.displayName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${AuthProviderService.instance.user?.email}",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(fontSize: 5),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Text(
                              "Sair da conta",
                              style: TextStyle(color: Colors.indigo[900]),
                            ),
                            onTap: () {
                              AuthProviderService.instance.signOut();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginPage()));
                            },
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            child: Text(
                              "Editar perfil",
                              style: TextStyle(color: Colors.indigo[900]),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
