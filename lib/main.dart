import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tenis de Corrida',
        value: 350,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 500, date: DateTime.now()),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          TrasactionList(_transactions),
          Card(
            elevation: 5,
            child: Column(children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Título'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      style:
                          // https://www.flutterbeads.com/text-button-color-in-flutter/
                          TextButton.styleFrom(foregroundColor: Colors.purple),
                      child: const Text('Nova Transação')),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
