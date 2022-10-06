import 'package:flutter/material.dart';

class GSBarberPage extends StatefulWidget {
  @override
  _GSBarberPageState createState() => _GSBarberPageState();
}

class _GSBarberPageState extends State<GSBarberPage> {
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
                  "GS Barber",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
