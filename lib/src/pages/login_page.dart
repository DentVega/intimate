import 'package:flutter/material.dart';
import 'package:intimate/src/widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = '';
  String _nickname = '';
  String _email = '';
  String _numberPhone = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intimos'),
      ),
      body: ListView(
        children: <Widget>[
          LogoWidget(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text('Registro'),
            ),
          ),
          _createEmail(),
          Divider(),
          _createPassword(),
          _createButtonLogin(),
          _createSignupButton(),
        ],
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
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
    );
  }

  Widget _createPassword() {
    return TextField(
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
    );
  }

  Widget _createButtonLogin() {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Center(
        child: RaisedButton(
          child: Text('Iniciar sesion'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _iniciarSession(),
        ),
      ),
    );
  }

  Widget _createSignupButton() {
    return Container(
      child: FlatButton(
        child: Text('Registrar'),
        onPressed: () => goSignup(),
      ),
    );
  }

  _iniciarSession() {}

  goSignup() {}
}
