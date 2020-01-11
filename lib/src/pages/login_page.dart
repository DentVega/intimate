import 'package:flutter/material.dart';
import 'package:intimate/src/utils/utils.dart';
import 'package:intimate/src/widgets/widget_util.dart';
import 'package:provider/provider.dart';

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
          WidgetUtil.createBackground(context, true),
          _createForm(context),
        ],
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                _createEmail(),
                SizedBox(
                  height: 30.0,
                ),
                _createPassword(),
                SizedBox(
                  height: 30.0,
                ),
                _createButtonLogin(context),
                WidgetUtil.createTextButton(context, 'Registrar', (){
                  goSignup(context);
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email de la persona',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (valor) {
          setState(() {
            _email = valor;
          });
        },
      ),
    );
  }

  Widget _createPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock)),
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
      ),
    );
  }

  Widget _createButtonLogin(BuildContext context) {
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () => _iniciarSession(),
        ),
      ),
    );
  }

  Widget _createSignupButton(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('Registrar', style: TextStyle(color: Colors.redAccent),),
        onPressed: () => goSignup(context),
      ),
    );
  }

  _iniciarSession() {
    Utils.navigateWithName(context, 'home');
  }

  goSignup(BuildContext context) {
    Utils.navigateWithName(context, 'sigup');
  }
}
