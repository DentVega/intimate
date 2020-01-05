import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/providers/profile.provider.dart';
import 'package:intimate/src/widgets/logo_widget.dart';
import 'package:provider/provider.dart';

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
  String _errorMessage = '';
  bool _isLoading;

  @override
  void initState() {
    _isLoading = false;
    _errorMessage = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
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
                _createButtonSignup(profileProvider),
              ],
            ),
          ),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(),);
    } return Container(height: 0.0, width: 0.0);
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

  Widget _createButtonSignup(ProfileProvider profileProvider) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Center(
        child: RaisedButton(
          child: Text('Registrar'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            profileProvider.uploadProfile(Profile(
                uid: '',
                email: 'dentvega6@gmail.com',
                name: 'Brian 3',
                nickName: 'Brian V3',
                score: 0
            ));
          },
        ),
      ),
    );
  }

}
