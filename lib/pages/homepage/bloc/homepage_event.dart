part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class PageLoaded extends HomepageEvent {}

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

class SexoChanged extends HomepageEvent {
  final String sexo;

  SexoChanged({required this.sexo});
}

class InitialDataLoad extends HomepageEvent {
  final Usuario user;

  InitialDataLoad({required this.user});
}
