import 'package:calculadora_legal/calculadora/bloc/calculadora_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/botao.dart';
import '../Widgets/texto.dart';
import '../model/calculadora.dart';


class CalculadoraView extends StatelessWidget {
  const CalculadoraView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bloc = context.read<CalculadoraBloc>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 2, 2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Header (Visor/Tela da Calculadora)
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 10, bottom: 20.0),
                alignment: Alignment.bottomRight,
                color: const Color.fromARGB(255, 11, 1, 1),
                child: BlocBuilder<CalculadoraBloc, String>(
                  builder: (_, texto) => Text(
                    texto,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: texto.length < 5
                            ? 80.0
                            : 80.0 - texto.length * 2.5 < 40
                                ? 40
                                : 80.0 - texto.length * 2.5,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            //Botões da Calculadora
            Container(
              color: const Color.fromARGB(255, 58, 0, 0),
              padding: const EdgeInsets.only(right: 10.0, left: 10, top: 5),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(Calculadora.botoes.length, (index) {
                  final botao = Calculadora.botoes[index];
                  return Center(
                    child: botao != ""
                        ? Botao(
                            textoDoBotao: Texto(
                              texto: botao.toString(),
                              index: index,
                            ),
                            funcaoDoBotao:
                                bloc.pegarFuncaoDoBotao(botao))
                        : SizedBox(
                            height: width / 4 - 30,
                            width: width / 4 - 30,
                          ),
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