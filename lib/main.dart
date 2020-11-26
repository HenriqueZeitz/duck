import 'package:flutter/material.dart';
import './views/financeiro_list.dart';
import 'package:provider/provider.dart';
import './provider/financeiro.dart';
import './routes//app_routes.dart';
import './views/form.dart';
import 'views/financeiro_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Financeiros(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Routes.HOME: (_) => FinanceiroList(),
          Routes.FINANCEIRO_FORM: (_) => FinanceiroForm(),
        },
      ),
    );
  }
}
