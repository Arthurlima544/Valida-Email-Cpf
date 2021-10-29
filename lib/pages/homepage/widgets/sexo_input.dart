import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/models/Sexo.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

class SexoSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              Radio<Genero>(
                value: Genero.masculino,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  value = state.sexo.stringToEnum();
                },
              ),
              Radio(
                value: Genero.feminino,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  value = state.sexo.stringToEnum();
                },
              ),
              Radio<Genero>(
                value: Genero.naobinario,
                groupValue: state.sexo.stringToEnum(),
                onChanged: (value) {
                  value = state.sexo.stringToEnum();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
