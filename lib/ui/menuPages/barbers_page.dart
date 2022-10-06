import 'package:flutter/material.dart';
import '../models/barbers_model.dart';

class BarbersPage extends StatefulWidget {
  @override
  _BarbersPageState createState() => _BarbersPageState();
}

class _BarbersPageState extends State<BarbersPage> {
  List<BarbersModel> barbersList = BarbersModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Barbeiros ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...barbersList.map(
            (data) {
              return Container(
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
                    ]),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("${data.imgPath}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${data.name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //Expanded(child: Text("")),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.plus_one,
                                size: 22,
                              ),
                            ),
                            Text(
                              "${data.rate.toInt()}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${data.desc}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
