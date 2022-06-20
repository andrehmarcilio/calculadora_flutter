class Calculadora {
  static const List botoes = [ "C", "<-", "( )", "÷", 7, 8, 9, 
  "x", 4, 5, 6, "-", 1, 2, 3, "+", 0, "", ".", "="];
  String conta = "";
  String resultado = "";
  String stringNumeroAtual = "";

  List<double> numeros = [];
  List<String> operadores = [];
  List<int> colchetesIndex = [];


   adicionarNumero(var numero) {
    stringNumeroAtual += numero.toString(); 
    return numero.toString();
    
  }

    adicionarOperador(String operador) {
    numeros.add(double.parse(stringNumeroAtual));
     stringNumeroAtual = "";
    operadores.add(operador);
    return  operador;
  }

   adicionarColchetes() {
    if (colchetesIndex.length % 2 == 0) {
      colchetesIndex.add(operadores.length);
       return "(";
       
    } else {
    colchetesIndex.add(operadores.length);
       return  ")";
    }
  }



  String formatarNumeroInteiro(double tavlezInteiro) {
    return tavlezInteiro - tavlezInteiro.round() == 0 ? 
    tavlezInteiro.toString().substring(0 , tavlezInteiro.toString().length - 2) 
    : tavlezInteiro.toString();
  }


  limparUm() {
    if(stringNumeroAtual.isEmpty) {
      
      if (operadores.length == (colchetesIndex.isNotEmpty ? colchetesIndex.last :  0)) {
        colchetesIndex.removeLast();
        return;
      }
      operadores.removeLast();
      stringNumeroAtual = formatarNumeroInteiro(numeros.last);
      numeros.removeLast();
     
    }  else {
      if (operadores.length == (colchetesIndex.isNotEmpty ? colchetesIndex.last :  -1) && colchetesIndex.length % 2 == 0) {
        colchetesIndex.removeLast();
        return;
      } 
     stringNumeroAtual = stringNumeroAtual.substring(0, stringNumeroAtual.length -1);
    }
   
  }

  limpar() {
    numeros.clear();
    operadores.clear();
    colchetesIndex.clear();
    stringNumeroAtual ="";
    return "";
  }




   calcular() {
    numeros.add(double.parse(stringNumeroAtual));
    List<double> numerosColchetes = [];
    List<String> operadoresColchetes = [];

        
        for(int i = 0; i < colchetesIndex.length; i += 2) {
          numerosColchetes.clear();
          operadoresColchetes.clear();
            for(int j = colchetesIndex[i]; j < colchetesIndex[i + 1]; j ++) {
              numerosColchetes.add(numeros[j]);
              operadoresColchetes.add(operadores[j]);
            }
             numerosColchetes.add(numeros[colchetesIndex[i + 1]]);
             numeros[colchetesIndex[i + 1]] =  double.parse(realizarOperacoes(operadoresColchetes, numerosColchetes));
             
        }

        for(int i = colchetesIndex.length - 2; i >= 0; i -= 2) {
          numeros.removeRange(colchetesIndex[i], colchetesIndex[i + 1]);
          operadores.removeRange(colchetesIndex[i], (colchetesIndex[i + 1]));
        }
    
    stringNumeroAtual = realizarOperacoes(operadores, numeros);
  
    numeros.clear();
    operadores.clear();
    colchetesIndex.clear();
    return  stringNumeroAtual;
  }

  

  

  String realizarOperacoes(List<String> operadores, List<double> numeros) {
    limpezaDasListas(int index, double result) {
      numeros[index + 1] = result;
      numeros.removeAt(index);
      operadores.removeAt(index);
  }

          double numero;
           while(operadores.contains("÷") || operadores.contains("x")) {
          if(operadores.contains("÷")){
          int index = operadores.indexOf("÷");
           numero = (numeros[index] / numeros[index + 1]);
            limpezaDasListas(index, numero);
          } else if(operadores.contains("x")){
             int index = operadores.indexOf("x");
           numero = (numeros[index] * numeros[index + 1]);
            limpezaDasListas(index, numero);
          }
        }
      
    for (int i = 0; i < operadores.length; i++) {
      switch(operadores[i]){
        case "+":
        numero = numeros[i] + numeros[i + 1];
        numeros[i+1] = numero;
        break;
        case "-":
        numero = numeros[i] - numeros[i + 1];
        numeros[i+1] = numero;
        break;
      }
    }
    return formatarNumeroInteiro(numeros.last);
  }

}