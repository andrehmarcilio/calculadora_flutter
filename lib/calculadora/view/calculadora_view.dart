import 'package:calculadora_legal/calculadora/Widgets/botoes.dart';
import 'package:flutter/material.dart';

import '../Widgets/visor.dart';

class CalculadoraView extends StatelessWidget {
  const CalculadoraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 2, 2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            //Header (Visor/Tela da Calculadora)
            Visor(),
            Botoes()
          ],
        ),
      ),
    );
  }
}
