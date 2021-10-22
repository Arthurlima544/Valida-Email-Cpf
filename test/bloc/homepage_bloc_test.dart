import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:validacao_email/models/Cpf.dart';
import 'package:validacao_email/models/Email.dart';
import 'package:validacao_email/pages/homepage/bloc/homepage_bloc.dart';

void main() {
  HomepageBloc bloc = HomepageBloc();
  /* test("Deve retornar estado inicial ", () {
    expectLater(
        bloc.state,
        emitsInOrder([
          HomepageState(
            cpf: Cpf.pure(""),
            email: Email.pure(""),
            status: FormzStatus.pure,
          )
        ]));
  }); */

  test("Deve retornar cpf e email validos ", () {
    final Email emailExpected = Email.dirty("test@gmail.com");
    final Cpf cpfExpected = Cpf.dirty("000.000.000-00");

    bloc.add(EmailChanged(email: "test@gmail.com"));
    bloc.add(CpfChanged(cpf: "000.000.000-00"));

    expectLater(
        bloc.stream,
        emitsInOrder([
          HomepageState(
            email: emailExpected,
            cpf: Cpf.pure(),
            status: FormzStatus.invalid,
          ),
          HomepageState(
              cpf: cpfExpected, email: emailExpected, status: FormzStatus.valid)
        ]));
  });
  /* test("Deve retornar cpf invalido ", () {
    final Cpf cpfExpected = Cpf.dirty("0");

    bloc.add(CpfChanged(cpf: "0"));

    expectLater(bloc.stream, emitsInOrder([HomepageState(cpf: cpfExpected)]));
  });

  test("Deve retornar status de valido para o formulario ", () {
    final Email emailExpected = Email.dirty("test@gmail.com");
    final Cpf cpfExpected = Cpf.dirty("000.000.000-00");

    bloc.add(EmailChanged(email: "test@gmail.com"));
    bloc.add(EmailUnfocused());
    bloc.add(CpfChanged(cpf: "000.000.000-00"));
    bloc.add(CpfUnfocused());

    expectLater(
        bloc.stream,
        emitsInOrder([
          HomepageState(email: emailExpected, status: FormzStatus.valid),
          HomepageState(cpf: cpfExpected, status: FormzStatus.valid)
        ]));
  });
  */
}
