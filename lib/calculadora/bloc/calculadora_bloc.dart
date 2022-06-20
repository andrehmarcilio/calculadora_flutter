import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/calculadora.dart';

class CalculadoraBloc extends Cubit<String> {
  final Calculadora _calculadora;
  CalculadoraBloc(this._calculadora) : super('');

  mudarTexto(String texto) {
      emit(state + texto);
  }

  mostrarResultado(String resultado) {
       emit(resultado);
  }

  limpar() {
      emit("");
    _calculadora.limpar();
  }

  limparUm() {
    if (state.isNotEmpty) {
        emit(state.substring(0, state.length - 1));
      _calculadora.limparUm();
    }
  }

  VoidCallback pegarFuncaoDoBotao(var textoBotao) {
    print(textoBotao);
    if (textoBotao.runtimeType == int || textoBotao == ".") {
      return () {
        print('adicionarNumero');
        mudarTexto(_calculadora.adicionarNumero(textoBotao));
      };
    } else {
      switch (textoBotao) {
        case "C":
          return limpar;
        case "=":
          return () {
            print('mostrarResultado');
            mostrarResultado(_calculadora.calcular());
          };
        case "<-":
          return limparUm;
        case "( )":
          return () {
            print('adicionarColchetes');
            mudarTexto(_calculadora.adicionarColchetes());
          };
        default:
          return () {
            print('adicionarOperador');
            mudarTexto(_calculadora.adicionarOperador(textoBotao));
          };
      }
    }
  }


}