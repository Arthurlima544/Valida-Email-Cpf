import 'package:formz/formz.dart';

const List<String> genero = ["M", "N", "F"];

enum SexoValidationError { vazio }

enum Genero { masculino, naobinario, feminino, vazio }

class Sexo extends FormzInput<String, SexoValidationError> {
  const Sexo.dirty([String value = ""]) : super.dirty(value);
  const Sexo.pure([String value = ""]) : super.pure(value);

  Genero stringToEnum(String value) {
    switch (value) {
      case "M":
        return Genero.masculino;
      case "F":
        return Genero.feminino;
      case "N":
        return Genero.naobinario;
      default:
        return Genero.vazio;
    }
  }

  @override
  SexoValidationError? validator(String value) {
    for (int i = 0; i < genero.length; i++) {
      if (value == genero[i]) {
        return null;
      }
    }
    return SexoValidationError.vazio;
  }
}
