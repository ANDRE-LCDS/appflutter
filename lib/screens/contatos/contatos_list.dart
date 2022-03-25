import 'package:flutter/material.dart';

import '../../database/dao/contato_dao.dart';
import '../../models/contato.dart';
import 'ContatosFormularios.dart';

class ContatosLista extends StatelessWidget {

  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: _dao.buscaContato(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List contatos = snapshot.data as List;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return _ContatoItem(contato);
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => contactForm(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contato contato;

  _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}