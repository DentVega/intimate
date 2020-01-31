
import 'dart:async';

class Validators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email no es valido');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Mas de 6 caracteres por favor');
      }
  }
  );

  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if (name.length >= 1) {
        sink.add(name);
      } else {
        sink.addError('Rellene el campo');
      }
    }
  );

  final validateNikName = StreamTransformer<String, String>.fromHandlers(
      handleData: (nickName, sink) {
        if (nickName.length >= 1) {
          sink.add(nickName);
        } else {
          sink.addError('Rellene el campo');
        }
      }
  );

  final validateDateBirth = StreamTransformer<DateTime, DateTime>.fromHandlers(
    handleData: (dateBirth, sink) {
      if (dateBirth != null) {
        sink.add(dateBirth);
      } else {
        sink.addError('Rellene el campo');
      }
    }
  );

}