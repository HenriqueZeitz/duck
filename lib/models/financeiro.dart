import 'package:flutter/material.dart';

class Financeiro {
  final String id;
  final String descricao;
  final double valor;
  final String data;
  final String tpLancamento;

  const Financeiro({
    this.id,
    this.descricao,
    @required this.valor,
    @required this.data,
    @required this.tpLancamento,
  });
}
