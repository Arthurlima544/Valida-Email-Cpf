part of 'homepage_bloc.dart';

class HomepageState extends Equatable {
  const HomepageState({
    this.email = const Email.pure(),
    this.cpf = const Cpf.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Cpf cpf;
  final FormzStatus status;

  HomepageState copyWith({
    Email? email,
    Cpf? cpf,
    FormzStatus? status,
  }) {
    return HomepageState(
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, status, cpf];
}
