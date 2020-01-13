import 'dart:async';
import 'package:intimate/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SigupBloc with Validators {

  final _emailController = BehaviorSubject<String>();

  final _passwordController = BehaviorSubject<String>();

  final _nameController = BehaviorSubject<String>();

  final _nickNameController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<String> get nameStream => _nameController.stream.transform(validateName);

  Stream<String> get nickNameStream => _nickNameController.stream.transform(validateNikName);

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changeName => _nameController.sink.add;

  Function(String) get changeNickName => _nickNameController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
    _nickNameController?.close();
  }

}