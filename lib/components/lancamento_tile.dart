import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/financeiro.dart';
import '../routes/app_routes.dart';
import '../provider/financeiro.dart';

class LancamentoTile extends StatelessWidget {
  final Financeiro financeiro;
  const LancamentoTile(this.financeiro);

  @override
  Widget build(BuildContext context) {
    final cupom = financeiro.tpLancamento == null ||
            financeiro.tpLancamento.toString().isEmpty ||
            financeiro.tpLancamento == 'Saida'
        ? CircleAvatar(
            child: Icon(Icons.remove),
            backgroundColor: Colors.red,
          )
        : CircleAvatar(child: Icon(Icons.add), backgroundColor: Colors.green);
    return ListTile(
      leading: cupom,
      title: Text(financeiro.valor.toStringAsFixed(2)),
      subtitle: Text(financeiro.descricao),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.FINANCEIRO_FORM, arguments: financeiro);
              },
              color: Colors.yellow[800],
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.yellow[700],
                    title: Text("Excluir lançamento"),
                    content: Text("Deseja excluir este lançamento?"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        color: Colors.green,
                        child: Text(
                          'Sim',
                          style: TextStyle(
                            color: (Colors.black),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        color: Colors.red,
                        child: Text(
                          'Não',
                          style: TextStyle(
                            color: (Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Financeiros>(context, listen: false)
                        .remove(financeiro);
                  }
                });
              },
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }
}
