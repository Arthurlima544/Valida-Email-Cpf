import 'package:flutter_test/flutter_test.dart';
import 'package:validacao_email/models/Sexo.dart';

void main() {
  test('Sexo input', () {
    Sexo sexo = Sexo.dirty("M");
    Genero genero = Genero.nenhum;

    genero = sexo.stringToEnum();

    expect(genero, Genero.masculino);
  });
}
