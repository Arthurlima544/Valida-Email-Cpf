import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:validacao_email/models/Cpf.dart';
import 'package:validacao_email/models/Email.dart';
import 'package:validacao_email/utils/validation_mixin.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageState());

  @override
  Stream<HomepageState> mapEventToState(HomepageEvent event) async* {
    //* EMAIL
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.cpf]),
      );
    }
    if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
          email: email, status: Formz.validate([email, state.email]));
    }
    //* CPF
    if (event is CpfChanged) {
      final cpf = Cpf.dirty(event.cpf);
      yield state.copyWith(
        cpf: cpf.valid ? cpf : Cpf.pure(event.cpf),
        status: Formz.validate([state.email, cpf]),
      );
    }
    if (event is CpfUnfocused) {
      final cpf = Cpf.dirty(state.cpf.value);
      yield state.copyWith(
          cpf: cpf, status: Formz.validate([state.email, cpf]));
    }
    //* Button
    if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final cpf = Cpf.dirty(state.cpf.value);
      yield state.copyWith(
          email: email, cpf: cpf, status: Formz.validate([email, cpf]));
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
