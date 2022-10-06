import 'package:flutter/material.dart';

class ServiceModel {
  final String name;
  final double price;
  final String desc;
  final Color color;

  ServiceModel({
    required this.name,
    required this.price,
    required this.desc,
    required this.color,
  });

  static List<ServiceModel> list = [
    ServiceModel(
      name: "Corte Degradê",
      price: 15.0,
      desc:
          "Inspirado no cabelo usado pelos militares americanos nas décadas de 40 e 50, esse tipo de corte apresenta os fios das laterais raspados gradualmente.",
      color: Color.fromRGBO(26, 35, 126, 1),
    ),
    ServiceModel(
      name: "Corte Degradê Nava.",
      price: 18.0,
      desc: "",
      color: Color.fromRGBO(26, 35, 126, 1),
    ),
    ServiceModel(
      name: "Corte Social",
      price: 13.0,
      desc:
          "O corte social masculino é curto nas laterais e levemente mais longo na parte de cima. O formato acompanha a cabeça, o que o torna um corte bem limpo, sem linhas marcadas e levemente repicado.",
      color: Color.fromRGBO(26, 35, 126, 1),
    ),
    ServiceModel(
      name: "Barba",
      price: 15.0,
      desc: "",
      color: Color.fromRGBO(183, 28, 28, 1),
    ),
    ServiceModel(
      name: "Sobrancelhas",
      price: 5.0,
      desc: "",
      color: Color.fromRGBO(183, 28, 28, 1),
    ),
    ServiceModel(
      name: "Selagem",
      price: 50.0,
      desc:
          "Um tratamento à base de queratina, que tem a função de fechar as cutículas do fio. A selagem recupera a saúde dos cabelos trazendo mais hidratação, resistência e brilho.",
      color: Color.fromRGBO(183, 28, 28, 1),
    ),
  ];
}
