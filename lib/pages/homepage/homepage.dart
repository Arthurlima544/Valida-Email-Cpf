import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';
import 'package:validacao_email/pages/homepage/widgets/cpf_input.dart';
import 'package:validacao_email/pages/homepage/widgets/email_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _emailFocusNode = FocusNode();
  final _cpfFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<HomepageBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_cpfFocusNode);
      }
    });
    _cpfFocusNode.addListener(() {
      if (!_cpfFocusNode.hasFocus) {
        context.read<HomepageBloc>().add(CpfUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _cpfFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funcionaaaaaaa"),
      ),
      body: BlocListener<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        child: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                EmailInput(
                  focusNode: _emailFocusNode,
                ),
                CpfInput(
                  focusNode: _cpfFocusNode,
                ),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state is HomepageState) {
          return ElevatedButton(
            onPressed: state.status.isValidated
                ? () => context.read<HomepageBloc>().add(FormSubmitted())
                : null,
            child: const Text('Submit'),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
