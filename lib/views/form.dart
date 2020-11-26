import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/financeiro.dart';
import '../provider/financeiro.dart';

class FinanceiroForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Financeiro lancamento) {
    if (lancamento != null) {
      _formData['id'] = lancamento.id;
      _formData['valor'] = lancamento.valor.toString();
      _formData['descricao'] = lancamento.descricao;
      _formData['data'] = lancamento.data;
      _formData['tpLancamento'] = lancamento.tpLancamento;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Financeiro lancamento = ModalRoute.of(context).settings.arguments;
    _loadFormData(lancamento);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(
          "Cadastro",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['valor'],
                decoration: InputDecoration(
                  labelText: 'Valor',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.toString().trim().isEmpty) {
                    return 'Indique um valor!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['valor'] = value,
              ),
              TextFormField(
                initialValue: _formData['descricao'],
                decoration: InputDecoration(
                  labelText: 'Descrição (opcional)',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onSaved: (value) => _formData['descricao'] = value,
              ),
              TextFormField(
                initialValue: _formData['data'],
                decoration: InputDecoration(
                  labelText: 'Data',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onSaved: (value) => _formData['data'] = value,
              ),
              TextFormField(
                initialValue: _formData['tpLancamento'],
                decoration: InputDecoration(
                  labelText: 'Tipo lançamento',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onSaved: (value) => _formData['tpLancamento'] = value,
              ),
              RaisedButton(
                color: Colors.yellow[700],
                onPressed: () {
                  final isValid = _form.currentState.validate();
                  if (isValid) {
                    _form.currentState.save();
                    Provider.of<Financeiros>(context, listen: false).put(
                      Financeiro(
                        id: _formData['id'],
                        descricao: _formData['descricao'],
                        valor: double.parse(_formData['valor']),
                        data: _formData['data'],
                        tpLancamento: _formData['tpLancamento'],
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Aplicar',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
