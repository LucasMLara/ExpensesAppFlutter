import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      trailing: MediaQuery.of(context).size.width > 400
                          ? TextButton(
                              onPressed: () => onRemove(tr.id),
                              child: Text(
                                'Excluir',
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            )
                          : IconButton(
                              onPressed: () => onRemove(tr.id),
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    ),
                  );
                })));
  }
}
