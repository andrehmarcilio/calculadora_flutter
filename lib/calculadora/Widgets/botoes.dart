import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculadora_bloc.dart';
import '../model/calculadora.dart';
import 'botao.dart';
import 'texto_do_botao.dart';

class Botoes extends StatelessWidget {
  const Botoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bloc = context.read<CalculadoraBloc>();
    return Container(
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
                    textoDoBotao: TextoDoBotao(
                      texto: botao.toString(),
                      index: index,
                    ),
                    funcaoDoBotao: bloc.pegarFuncaoDoBotao(botao))
                : SizedBox(
                    height: width / 4 - 30,
                    width: width / 4 - 30,
                  ),
          );
        }),
      ),
    );
  }
}
