import 'package:flutter/material.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/providers/profile.provider.dart';
import 'package:intimate/src/utils/utils.dart';
import 'package:intimate/src/widgets/logo_widget.dart';
import 'package:intimate/src/widgets/widget_util.dart';
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidgetUtil.createBackground(context, false),
          _createForm(context),
        ],
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
                height: 80.0,
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
                Text('Registro'),
                _createEmail(),
                Divider(),
                _createPassword(),
                Divider(),
                _createName(),
                Divider(),
                _createNickName(),
                Divider(),
                _createButtonSignup(profileProvider),
                WidgetUtil.createTextButton(context, 'Iniciar Sesion', () {
                  Navigator.pop(context);
                })
              ],
            ),
          )
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

  Widget _createName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
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
      ),
    );
  }

  Widget _createNickName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Apodo',
            labelText: 'Apodo',
            icon: Icon(Icons.account_circle)),
        onChanged: (value) {
          setState(() {
            _name = value;
          });
        },
      ),
    );
  }

  Widget _createButtonSignup(ProfileProvider profileProvider) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Center(
        child: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Registrar'),
          ),
          color: Colors.red,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
