part of 'homepage_bloc.dart';

class HomepageState extends Equatable {
  const HomepageState({
    this.email = const Email.pure(),
    this.cpf = const Cpf.pure(),
    this.sexo = const Sexo.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Cpf cpf;
  final Sexo sexo;
  final FormzStatus status;

  HomepageState copyWith({
    Email? email,
    Cpf? cpf,
    Sexo? sexo,
    FormzStatus? status,
  }) {
    return HomepageState(
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      sexo: sexo ?? this.sexo,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, status, cpf];
}
