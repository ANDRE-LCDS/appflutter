import 'package:flutter/material.dart';


import '../../database/dao/contato_dao.dart';
import '../../models/contato.dart';

class contactForm extends StatefulWidget {

  @override
  State<contactForm> createState() => _contactFormState();
}

class _contactFormState extends State<contactForm> {
  final TextEditingController _nomeContatoControlador = TextEditingController();
  final TextEditingController _numeroContaControlador = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Contatos'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
             TextField(
              controller: _nomeContatoControlador,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: TextStyle(fontSize: 24.0),
            ),
             Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numeroContaControlador,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                ),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: SizedBox(
                  width: 160.0,
                  child: ElevatedButton(
                    onPressed: () {
                      final String nome = _nomeContatoControlador.text;
                      final int? conta = int.tryParse(_numeroContaControlador.text);

                      final Contato NovoContato = Contato(0, nome, conta);
                      _dao.save(NovoContato).then((id) => Navigator.pop(context)
                      );
                    },
                    child: Text('Criar'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
