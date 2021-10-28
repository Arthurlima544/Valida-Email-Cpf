import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:validacao_email/models/Cpf.dart';
import 'package:validacao_email/models/Email.dart';
import 'package:validacao_email/models/Sexo.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

void main() {
  HomepageBloc bloc = HomepageBloc();
  test("Deve retornar formulario valido ", () {
    final Email emailExpected = Email.dirty("test@gmail.com");
    final Cpf cpfExpected = Cpf.dirty("000.000.000-00");
    final Sexo sexoExpected = Sexo.dirty("M");

    bloc.add(EmailChanged(email: "test@gmail.com"));
    bloc.add(CpfChanged(cpf: "000.000.000-00"));
    bloc.add(SexoChaged(sexo: "M"));

    expectLater(
        bloc.stream,
        emits([
          HomepageState(
            email: emailExpected,
            status: FormzStatus.invalid,
          ),
          HomepageState(
            cpf: cpfExpected,
            email: emailExpected,
            status: FormzStatus.invalid,
          ),
          HomepageState(
            cpf: cpfExpected,
            email: emailExpected,
            sexo: sexoExpected,
            status: FormzStatus.valid,
          )
        ]));
  });
}
