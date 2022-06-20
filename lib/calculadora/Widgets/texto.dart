import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  const Texto({ Key? key, required this.texto, required this.index }) : super(key: key);
  final String texto;
  final int index;


  Color escolherCor(int index) {
    if ((index + 1) % 4 == 0) {
    return const Color.fromARGB(255, 144, 135, 94);
    } else if (index <= 3) {
      return  const Color.fromARGB(127, 255, 255, 255);
    } else {
      return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(texto, 
    style:  TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w300,
      color: escolherCor(index)
    ),
    );
  }
}