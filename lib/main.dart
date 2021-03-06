import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validacao_email/pages/auxpage/auxpage.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

import 'package:validacao_email/pages/homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuxPage(),
    );
  }
}
