import 'package:flutter/material.dart';
import 'package:projeto_perguntas_app/questao.dart';
import 'package:projeto_perguntas_app/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(
              int.parse(resp['pontuacao'].toString()),
            ),
          );
        }).toList(),
      ],
    );
  }
}