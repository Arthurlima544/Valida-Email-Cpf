import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/models/Usuario.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';
import 'package:validacao_email/pages/homepage/homepage.dart';

final Usuario user =
    Usuario(email: "Arthur@gmail.com", sexo: "F", cpf: "05868048113");

class AuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auxpage"),
      ),
      body: ListTile(
        title: Text(
          'Meus dados',
          style: TextStyle(color: Colors.amber),
        ),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => HomepageBloc(),
                child: HomePage(
                  user: user,
                ),
              ),
            ),
          ),
        },
      ),
    );
  }
}
