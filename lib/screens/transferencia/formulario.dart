import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../database/dao/transferencia_dao.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloNumeroConta = 'Número da Conta';
const _dicaNumeroConta = '00.000-0';

const _rotuloValor = 'Valor';
const _dicaValor = '00.00';

const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  final TransferenciaDao _dao = TransferenciaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloNumeroConta,
                dica: _dicaNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(_botaoConfirmar),
              onPressed: () {
                _criaTransferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(0, valor, numeroConta);
      _dao.save(transferenciaCriada).then((id) => Navigator.pop(context));
    }
  }
}
