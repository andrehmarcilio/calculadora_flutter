import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/calculadora.dart';

part 'calculadora_states.dart';
part 'calculadora_events.dart';

class CalculadoraBloc extends Bloc<CalculadoraEventos, CalculadoraEstados> {
  final Calculadora _calculadora;
  CalculadoraBloc(this._calculadora) : super(EstadoInicial('')) {
    on<AdicionarDigito>(_adicionarDigito);
    on<MostrarResultado>(_mostrarResultado);
    on<Limpar>(_limpar);
    on<LimparUm>(_limparUm);
  }

  _adicionarDigito(AdicionarDigito event, Emitter emit) {
    if (state is MostrandoResultado) {
      emit(MostrandoResultado(_calculadora.conta,
          resultado: _calculadora.resultado));
    } else {
      emit(RecebendoDados(_calculadora.conta));
    }
  }

  _mostrarResultado(MostrarResultado event, Emitter emit) {
    _calculadora.calcular();
    emit(MostrandoResultado(_calculadora.conta,
          resultado: _calculadora.resultado));
  }

  _limpar(Limpar event, Emitter emit) {
    emit(EstadoInicial(''));
    _calculadora.limpar();
  }

  _limparUm(LimparUm event, Emitter<CalculadoraEstados> emit) {
    _calculadora.limparUm();
    if (state is MostrandoResultado) {
      emit(MostrandoResultado(_calculadora.conta,
          resultado: _calculadora.resultado));
    } else {
      emit(RecebendoDados(_calculadora.conta));
    }
  }

  VoidCallback pegarFuncaoDoBotao(var textoBotao) {
    if (textoBotao.runtimeType == int || textoBotao == ".") {
      return () {
        _calculadora.adicionarNumero(textoBotao);
         add(AdicionarDigito());
      };
    } else {
      switch (textoBotao) {
        case "C":
           return () {
            add(Limpar());
          };
        case "=":
          return () {
            add(MostrarResultado());
          };
        case "<-":
          return () {
            add(LimparUm());
          };
        case "( )":
          return () {
           _calculadora.adicionarColchetes();
            add(AdicionarDigito());
          };
        default:
          return () {
            _calculadora.adicionarOperador(textoBotao);
             add(AdicionarDigito());
          };
      }
    }
  }
}
