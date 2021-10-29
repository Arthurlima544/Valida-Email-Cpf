import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput(
      {Key? key, required this.focusNode, required this.initialEmail})
      : super(key: key);

  final FocusNode focusNode;
  final String initialEmail;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: initialEmail,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: 'Exemplo: joe@gmail.com',
            errorText: state.email.invalid ? 'Email invalido' : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<HomepageBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
