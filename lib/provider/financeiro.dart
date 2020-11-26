import 'dart:math';

import 'package:flutter/material.dart';
import '../models/financeiro.dart';
import '../data/lacamento.dart';

class Financeiros with ChangeNotifier {
  final Map<String, Financeiro> _itens = {...Lancamento};

  List<Financeiro> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Financeiro byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Financeiro financeiro) {
    if (financeiro == null) {
      return;
    }
    if (financeiro.id != null &&
        financeiro.id.trim().isNotEmpty &&
        _itens.containsKey(financeiro.id)) {
      print(financeiro.valor);
      _itens.update(
          financeiro.id,
          (_) => Financeiro(
                id: financeiro.id,
                descricao: financeiro.descricao,
                valor: financeiro.valor,
                data: financeiro.data,
                tpLancamento: financeiro.tpLancamento,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => Financeiro(
                id: id,
                descricao: financeiro.descricao,
                valor: financeiro.valor,
                data: financeiro.data,
                tpLancamento: financeiro.tpLancamento,
              ));
      notifyListeners();
    }

    // var qry = FirebaseFirestore.instance.document(financeiro.id).setData({
    //   "descricao": financeiro.descricao,
    //   "valor": financeiro.valor,
    //   "data": financeiro.data,
    //   "tpLancamento": financeiro.tpLancamento
    // });
  }

  void remove(Financeiro financeiro) {
    if (financeiro != null && financeiro.id != null) {
      _itens.remove(financeiro.id);
    }
    notifyListeners();
  }

  double residual() {
    double total = 0;
    _itens.forEach((key, value) {
      if (value.tpLancamento == 'Saida') {
        total -= value.valor;
      } else {
        total += value.valor;
      }
    });
    return total;
  }

  double entradas() {
    double total = 0;
    _itens.forEach((key, value) {
      if (value.tpLancamento == 'Entrada') {
        total += value.valor;
      }
    });
    return total;
  }

  double saidas() {
    double total = 0;
    _itens.forEach((key, value) {
      if (value.tpLancamento == 'Saida') {
        total += value.valor;
      }
    });
    return total;
  }
}
