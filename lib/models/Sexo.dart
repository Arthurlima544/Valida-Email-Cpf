import 'package:formz/formz.dart';

enum SexoValidationError { invalid }

enum Genero { masculino, feminino, naobinario, nenhum }

const List<String> genero = ["masculino", "naobinario", "feminino"];

class Sexo extends FormzInput<String, SexoValidationError> {
  const Sexo.pure([String value = '']) : super.pure(value);
  const Sexo.dirty([String value = '']) : super.dirty(value);

  @override
  SexoValidationError? validator(String? value) {
    for (int i = 0; i < genero.length; i++) {
      if (value == genero[i]) {
        return null;
      }
    }
    return SexoValidationError.invalid;
  }

  Genero stringToEnum() {
    switch (value) {
      case "M":
        return Genero.masculino;
      case "F":
        return Genero.feminino;
      case "N":
        return Genero.naobinario;
      default:
        return Genero.nenhum;
    }
  }
}
