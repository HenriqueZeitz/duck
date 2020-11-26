import '../models/financeiro.dart';

// class Lancamento {
//   Query qry = FirebaseFirestore.instance.collection('lancamentos');
// }
const Lancamento = {
  '1': const Financeiro(
    id: '1',
    descricao: "Salariozinho de programador",
    valor: 25000.00,
    data: "01/11/2020",
    tpLancamento: "Entrada",
  ),
  '2': const Financeiro(
    id: '2',
    descricao: "Teste lancamento 002",
    valor: 250.00,
    data: "23/11/2020",
    tpLancamento: "Saida",
  ),
  '3': const Financeiro(
    id: '3',
    descricao: "Teste lancamento 003",
    valor: 250.00,
    data: "23/11/2020",
    tpLancamento: "Saida",
  ),
  '4': const Financeiro(
    id: '4',
    descricao: "Teste lancamento 004",
    valor: 250.00,
    data: "23/11/2020",
    tpLancamento: "Saida",
  )
};
