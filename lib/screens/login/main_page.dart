import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard/telaDoUsuario.dart';
import 'auth_page.dart';

class firebaseOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong !'),
          );
        } else if (snapshot.hasData) {
          return telaDoUsuario();
        } else {
          return AuthPage();
        }
      },
    ),
  );
}