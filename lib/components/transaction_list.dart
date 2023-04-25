import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TrasactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        // Listview renderizando componentes sob demanda, tornando a aplicação mais performática
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) => Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "R\$ ${transactions[index].value.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM y')
                                .format(transactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                )));
  }
}
