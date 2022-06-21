import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculadora_bloc.dart';

class Visor extends StatelessWidget {
  const Visor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(right: 15.0, left: 10, bottom: 20.0),
        alignment: Alignment.bottomRight,
        color: const Color.fromARGB(255, 11, 1, 1),
        child: BlocBuilder<CalculadoraBloc, CalculadoraEstados>(
          builder: (_, state) {
            if (state is MostrandoResultado) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.resultado,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: state.conta.length < 5
                            ? 60.0
                            : 60.0 - state.conta.length * 2.5 < 40
                                ? 40
                                : 60.0 - state.conta.length * 2.5,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Text(
                    state.conta,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: state.conta.length < 5
                            ? 80.0
                            : 80.0 - state.conta.length * 2.5 < 40
                                ? 40
                                : 80.0 - state.conta.length * 2.5,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  )
                ],
              );
            }
            return Text(
              state.conta,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: state.conta.length < 5
                      ? 80.0
                      : 80.0 - state.conta.length * 2.5 < 40
                          ? 40
                          : 80.0 - state.conta.length * 2.5,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
