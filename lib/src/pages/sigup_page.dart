import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intimate/src/bloc/provider.dart';
import 'package:intimate/src/model/profile_model.dart';
import 'package:intimate/src/model/user.dart';
import 'package:intimate/src/providers/authentication.dart';
import 'package:intimate/src/providers/cloud_firestore_api.dart';
import 'package:intimate/src/widgets/dialog_generator.dart';
import 'package:intimate/src/widgets/widget_util.dart';

class SigUpPage extends StatefulWidget {
  @override
  _SigUpPageState createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  bool _isLoading;

  TextEditingController _inputFieldDateController = new TextEditingController();
  SignupBloc signupBloc;
  CloudFirestoreAPI cloudFirestoreApi = CloudFirestoreAPI();
  User user = new User();

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    signupBloc = Provider.signBloc(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidgetUtil.createBackground(context, false, false),
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
                _createDate(context),
                Divider(),
                _createButtonSignup(context),
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
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(height: 0.0, width: 0.0);
  }

  Widget _createEmail() {
    return StreamBuilder(
      stream: signupBloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Email de la persona',
                labelText: 'Email',
                errorText: snapshot.error),
            onChanged: signupBloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPassword() {
    return StreamBuilder(
      stream: signupBloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                errorText: snapshot.error),
            onChanged: signupBloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createName() {
    return StreamBuilder(
      stream: signupBloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: 'Nombre',
                labelText: 'Nombre',
                errorText: snapshot.error),
            onChanged: signupBloc.changeName,
          ),
        );
      },
    );
  }

  Widget _createNickName() {
    return StreamBuilder(
      stream: signupBloc.nickNameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: 'Apodo',
                labelText: 'Apodo',
                errorText: snapshot.error),
            onChanged: signupBloc.changeNickName,
          ),
        );
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return StreamBuilder(
      stream: signupBloc.dateBirthStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            enableInteractiveSelection: false,
            controller: _inputFieldDateController,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Fecha de nacimiento',
              labelText: 'Fecha de nacimiento',
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate(context);
            },
          ),
        );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picker != null) {
      setState(() {
        updateDate(picker);
        _inputFieldDateController.text = signupBloc.dateBirth.toString();
      });
    }
  }

  updateDate(DateTime date) => signupBloc.changeDateBirth(date);

  Widget _createButtonSignup(BuildContext context) {
    return StreamBuilder(
          stream: signupBloc.formValidStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  onPressed: snapshot.hasData ? () => save(context): null,
                ),
              ),
            );
          },
    );
  }

  save(BuildContext context) {
    String email = signupBloc.email;
    String password = signupBloc.password;
    String name = signupBloc.name;
    String nickName = signupBloc.nickName;
    DateTime dateTime = signupBloc.dateBirth;
    print('email: ${email}');
    print('password: ${password}');
    print('name: ${name}');
    print('nickName: ${nickName}');
    print('dateTime: ${dateTime}');
    DialogGenerator.showAlertLoading(context);
    var auth = Auth();
    auth.signUp(email, password).then((onValue) {
      if (onValue != null) {
        print(onValue);
        print(onValue.uid);
        if (onValue.uid != null) {
          Profile profile = Profile(
              uid: onValue.uid,
              email: email,
              name: name,
              nickName: nickName,
              score: 0,
              dateBirth: Timestamp.fromDate(dateTime));
          cloudFirestoreApi.uploadProfile(profile).then((onValue) {
            completeRegister(context);
          });
        } else {
          closeLoadingDialog(context);
        }
      } else {
        closeLoadingDialog(context);
      }
    });
  }

  completeRegister(BuildContext context) {
    Future timeOut = Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
      DialogGenerator.completeRegister(context);
    });
  }

  closeLoadingDialog(BuildContext context) {
    Future timeOut = Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    super.dispose();
    signupBloc.changeEmail('');
    signupBloc.changePassword('');
    signupBloc.changeName('');
    signupBloc.changeNickName('');

  }

}
