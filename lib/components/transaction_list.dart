import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TrasactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // Listview renderizando componentes sob demanda, tornando a aplicação mais performática
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Não há transações cadastradas!',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              })
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: ((context, index) {
                  final tr = transactions[index];
                  return TransactionItem(tr: tr, onRemove: onRemove);
                })));
  }
}
