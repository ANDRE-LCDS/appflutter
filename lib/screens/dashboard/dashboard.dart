import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../contatos/contatos_list.dart';
import '../transferencia/lista.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){ Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListaTranferencias(),
                  ),
                );
                },
                child: Container(
                  child: Image.asset('lib/images/bytebank_logo.png'),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.green[900],
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContatosLista(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 110,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 64.0,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
