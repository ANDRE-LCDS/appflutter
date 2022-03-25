import 'package:app1/screens/dashboard/dashboard.dart';
import 'package:app1/screens/dashboard/telaDoUsuario.dart';
import 'package:app1/screens/login/auth_page.dart';
import 'package:app1/screens/login/main_page.dart';
import 'package:app1/screens/login/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'SecondaryApp',
      options: const FirebaseOptions(
        apiKey:
            'AAAAvCF-m8Q:APA91bHFhgx6K51UZA6SGzslUZdPUogH8tf0njjtZQkYaRcWfXBbqdASh4CH5xp0gLv8yK6jsVhqy6Soqjlvo7c6sft0B2i8Jo4DKQbTz0REw7iszwy0GPMQ2SWvnSPjr_iRmSXb8pBy',
        appId: '1:808015797188:android:3712982f3c820f910aa291',
        messagingSenderId: '808015797188',
        projectId: 'meuappandre',
      ));
  runApp(Bytebank());
}

final navigatorKey = GlobalKey<NavigatorState>();

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
            secondary: Colors.tealAccent,
          ),
        ),
        home: Dashboard()
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
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
