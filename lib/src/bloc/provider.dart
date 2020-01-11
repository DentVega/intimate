import 'package:flutter/material.dart';
import 'package:intimate/src/bloc/login_bloc.dart';
export 'package:intimate/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child,);
    }
    return  _instancia;
  }

  final logicBloc = LoginBloc();

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static LoginBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().logicBloc;
  }

}