import 'package:formz/formz.dart';

enum CpfValidationError { invalid }

class Cpf extends FormzInput<String, CpfValidationError> {
  const Cpf.pure([String value = '']) : super.pure(value);
  const Cpf.dirty([String value = '']) : super.dirty(value);

  static final _cpfRegex = RegExp(
      r"([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})");

  @override
  CpfValidationError? validator(String? value) {
    return _cpfRegex.hasMatch(value ?? '') ? null : CpfValidationError.invalid;
  }
}
