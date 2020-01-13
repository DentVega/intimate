import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intimate/src/pages/home_page.dart';
import 'package:intimate/src/pages/login_page.dart';
import 'package:intimate/src/providers/AuthService.dart';
import 'package:intimate/src/widgets/LoadingCircle.dart';
import 'package:intimate/src/widgets/widget_util.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidgetUtil.createBackground(context, true, true)

        ],
      ),
    );
  }

  Widget createLoader(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // log error to console                                            ⇐ NEW
            if (snapshot.error != null) {
              print("error");
              return Text(snapshot.error.toString());
            }
            // redirect to the proper page, pass the user into the
            // `HomePage` so we can display the user email in welcome msg     ⇐ NEW
            return snapshot.hasData ? HomePage(snapshot.data) : LoginPage();
          } else {
            // show loading indicator                                         ⇐ NEW
            return LoadingCircle();
          }
        }
    );
  }

}
