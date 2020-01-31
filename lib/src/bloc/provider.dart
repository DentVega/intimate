import 'package:flutter/material.dart';
import 'package:intimate/src/bloc/login_bloc.dart';
export 'package:intimate/src/bloc/login_bloc.dart';
import 'package:intimate/src/bloc/signup_bloc.dart';
export 'package:intimate/src/bloc/signup_bloc.dart';

class Provider extends InheritedWidget {

  final logicBloc = LoginBloc();
  final signupBloc = SignupBloc();


  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child,);
    }
    return  _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static LoginBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().logicBloc;
  }

  static SignupBloc signBloc (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().signupBloc;
  }

}