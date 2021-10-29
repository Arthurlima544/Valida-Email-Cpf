import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

class CpfInput extends StatelessWidget {
  const CpfInput({Key? key, required this.focusNode, required this.initialCpf})
      : super(key: key);
  final String initialCpf;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: initialCpf,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: 'Cpf',
            helperText: 'Exemplo: 000.000.000-00',
            errorText: state.cpf.invalid ? 'Cpf invalido' : null,
          ),
          onChanged: (value) {
            context.read<HomepageBloc>().add(CpfChanged(cpf: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
