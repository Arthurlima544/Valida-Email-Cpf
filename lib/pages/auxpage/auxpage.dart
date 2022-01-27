import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/models/Usuario.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';
import 'package:validacao_email/pages/homepage/homepage.dart';

final Usuario user =
    Usuario(email: "Arthur@gmail.com", sexo: "F", cpf: "79788637868");

class AuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auxpage"),
      ),
      body: Container(
        child: Center(
          child: ListTile(
            title: Center(
              child: Text(
                'Ir Para Página',
                style: TextStyle(color: Colors.black),
              ),
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
        ),
      ),
    );
  }
}
