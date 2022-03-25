import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor(
      {required this.controlador,
        required this.rotulo,
        required this.dica,
        this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.00, 16.0, 8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}