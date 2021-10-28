import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/models/Sexo.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';


class SexoSwitch extends StatelessWidget {
  final String userOption;
  SexoSwitch({required this.userOption});

  @override
  Widget build(BuildContext context) {
    Genero opcao = Genero.vazio;
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Radio<Genero>(
                value: Genero.masculino,
                groupValue: state.sexo.stringToEnum("M"),
                onChanged: (value) {
                  context.read<HomepageBloc>().add(SexoChaged(sexo: "M"));
                },
              ),
              Text("Masculino"),
              Radio<Genero>(
                value: Genero.feminino,
                groupValue: state.sexo.stringToEnum("F"),
                onChanged: (value) {
                  context.read<HomepageBloc>().add(SexoChaged(sexo: "F"));
                },
              ),
              Text("Feminino"),
            ],
          ),
        );
      },
    );
  }


}
