import 'package:flutter/material.dart';
import 'package:intimate/src/bloc/provider.dart';
import 'package:intimate/src/utils/utils.dart';
import 'package:intimate/src/widgets/widget_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidgetUtil.createBackground(context, true, false),
          _createForm(context),
        ],
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 150.0,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: <Widget>[
                Text('Inicio de sesion'),
                SizedBox(
                  height: 30.0,
                ),
                _createEmail(bloc),
                SizedBox(
                  height: 50.0,
                ),
                _createPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _createButtonLogin(bloc, context),
                WidgetUtil.createTextButton(context, 'Registrar', () {
                  goSignup(context);
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.redAccent,),
                hintText: 'ejemplo@correo.com',
                labelText: 'Email',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
    ;
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.redAccent,),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButtonLogin(LoginBloc bloc, BuildContext context) {
    return StreamBuilder(
          stream: bloc.formValidStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Center(
                child: RaisedButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    child: Text('Ingresar'),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: snapshot.hasData ? () => _iniciarSession() : null,
                ),
              ),
            );
          },
    );
  }

  _iniciarSession() {
    Utils.navigateWithName(context, 'home');
  }

  goSignup(BuildContext context) {
    Utils.navigateWithName(context, 'sigup');
  }
}
