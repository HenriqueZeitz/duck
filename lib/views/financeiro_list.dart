import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/lancamento_tile.dart';
import '../provider/financeiro.dart';
import '../routes/app_routes.dart';

class FinanceiroList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Financeiros lancamento = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text("Lista de lançamentos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.FINANCEIRO_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: lancamento.count,
        itemBuilder: (ctx, i) => LancamentoTile(lancamento.byIndex(i)),
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        color: Colors.yellow[700],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Entradas",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Saidas",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Residual",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lancamento.entradas().toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    lancamento.saidas().toStringAsFixed(2),
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    lancamento.residual().toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
