import 'package:flutter/material.dart';
import 'package:intimate/src/widgets/logo_widget.dart';

class SigUpPage extends StatefulWidget {
  @override
  _SigUpPageState createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  String _name = '';
  String _nickname = '';
  String _email = '';
  String _numberPhone = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: ListView(
        children: <Widget>[
          LogoWidget(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createName(),
          Divider(),
          _createNickName(),
          Divider(),
          _createButtonSignup(),
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

  Widget _createName() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createNickName() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Apodo',
          labelText: 'Apodo',
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createButtonSignup() {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Center(
        child: RaisedButton(
          child: Text('Registrar'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => signUp(),
        ),
      ),
    );
  }

  void signUp() {}
}
