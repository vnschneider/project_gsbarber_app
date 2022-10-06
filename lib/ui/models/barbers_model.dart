import 'package:flutter/material.dart';

class BarbersModel {
  final String name;
  final double rate;
  final String desc;
  final Color color;
  final String imgPath;

  BarbersModel({
    required this.name,
    required this.rate,
    required this.desc,
    required this.color,
    required this.imgPath,
  });

  static List<BarbersModel> list = [
    BarbersModel(
      name: "Gustavo Souza",
      rate: 2.0,
      desc: "Fundador e proprietário",
      color: Color.fromRGBO(26, 35, 126, 1),
      imgPath: "assets/profilegs.jpg",
    ),
    BarbersModel(
      name: "Marcos Arthur",
      rate: 1.0,
      desc: "Recem contratado",
      color: Color.fromRGBO(26, 35, 126, 1),
      imgPath: "assets/profilema.jpg",
    ),
    BarbersModel(
      name: "Barbeiro Newbie",
      rate: 5.0,
      desc: "Recem contratado",
      color: Color.fromRGBO(26, 35, 126, 1),
      imgPath: "assets/logogs2.png",
    ),
  ];
}
