part of 'homepage_bloc.dart';

class HomepageState extends Equatable {
  const HomepageState({
    this.email = const Email.pure(),
    this.cpf = const Cpf.pure(),
    this.status = FormzStatus.pure,
    this.sexo = const Sexo.pure(),
  });

  final Email email;
  final Cpf cpf;
  final Sexo sexo;
  final FormzStatus status;

  HomepageState copyWith({
    Email? email,
    Cpf? cpf,
    FormzStatus? status,
    Sexo? sexo,
  }) {
    return HomepageState(
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      status: status ?? this.status,
      sexo: sexo ?? this.sexo,
    );
  }

  @override
  List<Object> get props => [email, status, cpf, sexo];
}
