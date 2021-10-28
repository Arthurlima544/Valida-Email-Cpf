part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class InitialData extends HomepageEvent {
  final String user;

  InitialData({required this.user});
}

class EmailChanged extends HomepageEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends HomepageEvent {}

class CpfChanged extends HomepageEvent {
  const CpfChanged({required this.cpf});

  final String cpf;

  @override
  List<Object> get props => [cpf];
}

class CpfUnfocused extends HomepageEvent {}

class FormSubmitted extends HomepageEvent {}

class SexoChaged extends HomepageEvent {
  const SexoChaged({required this.sexo});

  final String sexo;

  @override
  List<Object> get props => [sexo];
}

class SexoUnfocused extends HomepageEvent {}
