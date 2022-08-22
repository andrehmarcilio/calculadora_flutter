part of 'calculadora_bloc.dart';

class CalculadoraEstados {
   final String conta;
   CalculadoraEstados(this.conta);
}

class EstadoInicial extends CalculadoraEstados {
  EstadoInicial(conta) : super(conta);
}

class RecebendoDados extends CalculadoraEstados {
  RecebendoDados(conta) : super(conta); 
}

class MostrandoResultado extends CalculadoraEstados {
  final String resultado;
  MostrandoResultado(conta, {required this.resultado}) : super(conta);
}
