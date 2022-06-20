import 'package:calculadora_legal/calculadora/bloc/calculadora_bloc.dart';
import 'package:calculadora_legal/calculadora/view/calculadora_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/calculadora.dart';

class CalculadoraContainer extends StatelessWidget {
  const CalculadoraContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CalculadoraBloc(Calculadora()),
    child: const CalculadoraView(),);
  }
}