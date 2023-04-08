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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: _transactions
                .map((e) => Card(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "R\$ ${e.value.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                e.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                e.date.toString(),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
