import 'package:flutter/material.dart';
import '../Utils/calculadora.dart';
import '../Widgets/botao.dart';
import '../Widgets/texto.dart';

const List<dynamic> calculadoraMock = ["C", "<-", "( )", "÷", 7,8,9,"x",4,5,6,"-",1,2,3,"+",0,"",".","="]; 

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final Calculadora _calculadora = Calculadora();
  String texto = "";

  //MARK - Funcões 

  mudarTexto(String texto) {
    setState(() {
      this.texto += texto;
    });
  }

  mostrarResultado(String resultado) {
    setState(() {
      texto = resultado;
    });
  }

  limpar() {
    setState(() {
      texto = "";
    });
    _calculadora.limpar();
  }

  limparUm() {
      if(texto.isNotEmpty) {
     setState(() {
      texto = texto.substring(0, texto.length -1);
    });
     _calculadora.limparUm();
      }
  }

    pegarFuncaoDoBotao(var textoBotao) {
    if (textoBotao.runtimeType == int || textoBotao == ".") {
        return mudarTexto(_calculadora.adicionarNumero(textoBotao));
    } else {
        switch(textoBotao) {
          case "C": 
            return limpar();
          case "=":  
             return mostrarResultado(_calculadora.calcular());
          case "<-":
             return limparUm();
          case "( )":
              return mudarTexto(_calculadora. adicionarColchetes());
           default: 
               return mudarTexto(_calculadora.adicionarOperador(textoBotao));
         }}
  }

  //MARK: - Build

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 2, 2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Header (Visor/Tela da Calculadora)
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 15.0, left: 10, bottom: 20.0),
                alignment: Alignment.bottomRight,
                color:  const Color.fromARGB(255, 11, 1, 1),
                child:   Text(texto, 
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: texto.length < 5 ? 80.0 : 80.0 - texto.length * 2.5 < 40 ? 40 : 80.0 - texto.length * 2.5,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
                ),),
              ),
            ),
            //Botões da Calculadora
            Container(
              color: const Color.fromARGB(255, 58, 0, 0),
              padding: const EdgeInsets.only(right: 10.0, left: 10, top: 5),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap : true,
                crossAxisCount: 4,
                children: List.generate(calculadoraMock.length, (index) {
              return  Center(
                child: calculadoraMock[index] != "" ? Botao(
                  textoDoBotao: Texto(
                  texto: calculadoraMock[index].toString(), index: index,),
                  funcaoDoBotao: () => pegarFuncaoDoBotao(calculadoraMock[index])
                ): SizedBox(
                      height: width/4 - 30 ,
                      width: width/4 - 30,),
              );
          }),
        ),
            ),
          ],
        ),
      ),
    );
  }
}