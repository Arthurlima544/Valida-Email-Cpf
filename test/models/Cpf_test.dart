import 'package:flutter_test/flutter_test.dart';
import 'package:validacao_email/models/Cpf.dart';

void main() {
  test("deve retornar nulo quando valor do cpf for valido", () {
    Cpf model = Cpf.dirty("000.000.000-00");

    expect(model.validator(model.value), null);
  });
  test("deve retornar um Erro quando cpf for invalido", () {
    Cpf model = Cpf.dirty("");

    expect(model.validator(model.value), CpfValidationError.invalid);
  });
}
