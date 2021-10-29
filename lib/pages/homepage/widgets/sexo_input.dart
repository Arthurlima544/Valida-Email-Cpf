import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/models/Sexo.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

class SexoSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String aux;
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Radio<Genero>(
                value: Genero.masculino,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  context
                      .read<HomepageBloc>()
                      .add(SexoChanged(sexo: enumToString(value)));
                },
              ),
              Text("Masculino"),
              Radio<Genero>(
                value: Genero.feminino,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  context
                      .read<HomepageBloc>()
                      .add(SexoChanged(sexo: enumToString(value)));
                },
              ),
              Text("Feminino"),
              Radio<Genero>(
                value: Genero.naobinario,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  context
                      .read<HomepageBloc>()
                      .add(SexoChanged(sexo: enumToString(value)));
                },
              ),
              Text("Não-Binário"),
            ],
          ),
        );
      },
    );
  }

  String enumToString(Genero? genero) {
    switch (genero) {
      case Genero.masculino:
        return "M";
      case Genero.feminino:
        return "F";
      case Genero.naobinario:
        return "N";
      default:
        return "";
    }
  }
}
