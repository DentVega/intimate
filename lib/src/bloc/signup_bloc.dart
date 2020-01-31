import 'dart:async';
import 'package:intimate/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc with Validators {

  final _emailController = BehaviorSubject<String>();

  final _passwordController = BehaviorSubject<String>();

  final _nameController = BehaviorSubject<String>();

  final _nickNameController = BehaviorSubject<String>();

  final _dateBirthController = BehaviorSubject<DateTime>();

  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  Stream<String> get nameStream => _nameController.stream.transform(validateName);

  Stream<String> get nickNameStream => _nickNameController.stream.transform(validateNikName);

  Stream<DateTime> get dateBirthStream => _dateBirthController.stream.transform(validateDateBirth);

  Stream<bool> get formValidStream => CombineLatestStream.combine5(emailStream,
      passwordStream, nameStream, nickNameStream, dateBirthStream,
          (e, p, n, ni, d) {
              print(e);
              print(p);
              print(n);
              print(ni);
              print(d);
              return true;
          });

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changeName => _nameController.sink.add;

  Function(String) get changeNickName => _nickNameController.sink.add;

  Function(DateTime) get changeDateBirth => _dateBirthController.sink.add;

  String get email => _emailController.value;

  String get password => _passwordController.value;

  String get name => _nameController.value;

  String get nickName => _nickNameController.value;

  DateTime get dateBirth => _dateBirthController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
    _nickNameController?.close();
    _dateBirthController?.close();
  }

}