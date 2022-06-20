import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({ Key? key, required this.textoDoBotao, required this.funcaoDoBotao }) : super(key: key);
  final Widget textoDoBotao; 
  final VoidCallback funcaoDoBotao;
  


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextButton(onPressed: funcaoDoBotao, child: textoDoBotao, 
    style:  ButtonStyle(
      fixedSize: MaterialStateProperty.all<Size>(Size((width/4 - 30), (width/4 - 30))),
      minimumSize: MaterialStateProperty.all<Size>(Size((width/4 - 30), (width/4 - 30))),
      overlayColor: MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 100, 13, 12)),
    ),);
  }
}