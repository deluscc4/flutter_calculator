import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
//9: Importe o pacote math_expressions.

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  String mensagemVisor = '';

  //3: Para resolver as equações com as operações disponíveis em nossa calculadora utilizaremos um pacote chamado math_expressions. Esse paco consegue pegar uma equação elaborada, como por exemplo (3+2) ou (10+5)/3 e resolvê-la. Nesse sentido, crie um método chamado setarValor que receberá um parâmetro do tipo String para o valor da tecla pressionada.
  void setarValor(String valorTeclaPressionada) {
      if (mensagemVisor == '0') {
        mensagemVisor = valorTeclaPressionada;
      } else {
        mensagemVisor += valorTeclaPressionada;
      };
  }

  void resetar() {
    mensagemVisor = '';
  }

  realizarCalculo() {
    Parser p = Parser();
    Expression exp = p.parse(mensagemVisor);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    mensagemVisor = '$eval';
  }

  //5: Dentro do método setValor insira um setState e dentro do setState crie uma estrutura condicional que deve testar se a variável mensagemVisor é igual a 0. Caso seja, a variável mensagemVisor deve apenas receber o primeiro valor repassado, caso contrário, utilize o += para receber e concatenar o valor na String e formar a expressão.

  //6: Crie um método chamado resetar para zerar a calculadora caso precise realizar outras contas.

  //10: Crie um método chamado realizarCalculo.

  //11: Utilizando o arquivo readme e os exemplos disponíveis na página oficial do pacote math_expressions crie uma variável que receba a nossa expressão matemática que atualmente se encontra dentro da variável mensagemVisor.

  //12: Ainda utilizando a documentação oficial da math_expressions faça com que a expressão seja executada e que o resultado seja armazenado em uma outra variável.

  //13: Utilizando um setState, ainda dentro do método realizarCalculo faça com que o valor da variável mensagemVisor seja atualizado para o resultado obtido através do uso da math_expressions. Você precisará converter esse resultado para String (se não souber como fazer esse tipo de conversão dê um Google xD).

  //14: Para a tecla de divisão utilizamos o símbolo "÷", entretanto, esse símbolo não é reconhecido desta forma nas expressões matemáticas. Utilize o método replaceAll (https://api.flutter.dev/flutter/dart-core/String/replaceAll.html) para substituir o símbolo "÷" pelo "/" antes da expressão ser repassada ao math_expressions.

  //15: Na versão mais recente do Flutter o RaisedButton foi descontinuado. Como desafio, sugiro que você atualize esse widget para a versão mais recente. Dê uma olhada no link a seguir: https://api.flutter.dev/flutter/material/RaisedButton-class.html.

  //16: Execute o app.

  //17: Seja feliz!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              margin: EdgeInsets.all(15),
              width: 400,
              height: 120,
              child: Text(
                mensagemVisor,
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.all(15),
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //4: No método onPressed faça uma chamada para o método setValor e passe o valor da tecla pressionada. Lembre-se que nessa altura seu código já deve estar otimizado para que os botões sejam construídos através de uma função.
                          //7: Para as teclas: C e DEL, no onPressed ao invés do setValor chame o método resetar para zerar a calculadora.
                          criarBotao('C', ''),
                          criarBotao('DEL', ''),
                          criarBotao('%', ' % '),
                          criarBotao('÷', ' / '),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          criarBotao('7', '7'),
                          criarBotao('8', '8'),
                          criarBotao('9', '9'),
                          criarBotao('*', ' * '),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          criarBotao('4', '4'),
                          criarBotao('5', '5'),
                          criarBotao('6', '6'),
                          criarBotao('+', ' + '),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          criarBotao('1', '1'),
                          criarBotao('2', '2'),
                          criarBotao('3', '3'),
                          criarBotao('-', ' - '),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          criarBotao('0', '0'),
                          criarBotao('.', '.'),
                          criarBotao('=', ' = ')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//1 : Crie uma função que será responsável por construir os botões da calculadora evitando a redundância que temos atualmente no código-fonte. Se tiver dúvidas quanto à criação dessa função volte e assista a aula #41 - App Marimba - Atualizando a interface do nosso App (https://www.youtube.com/watch?v=HevYf8Pila4).
Expanded criarBotao(String nomeBotao, String mensagem) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: () {
          setState(() {
            if ((nomeBotao != 'C') && (nomeBotao != 'DEL') && (nomeBotao != '=')) {
              setarValor('$mensagem');
            } else if (nomeBotao == '=') {
              realizarCalculo();
            } else {
              resetar();
            }
          });
        },
        child: Text(
          '$nomeBotao',
          style: TextStyle(
              fontSize: 28,
              color: Colors.blue
          ),
        ),
      ),
    );
}
//2: Lembre-se de repassar as informações necessárias para dentro da função a ser criada no - 1. São algumas das principais informações a serem repassadas: o caracter da tecla, a cor da tecla e o método onPressed.

}
