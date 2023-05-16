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
        height: 430,

        // Listview renderizando componentes sob demanda, tornando a aplicação mais performática
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  const Text('Não há transações cadastradas!'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
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
                      trailing: IconButton(
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
// (ctx, index) => Card(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 10),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: Theme.of(context).primaryColor,
//                                     width: 2)),
//                             padding: const EdgeInsets.all(10),
//                             child: Text(
//                               "R\$ ${transactions[index].value.toStringAsFixed(2)}",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 transactions[index].title,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 DateFormat('d MMM y')
//                                     .format(transactions[index].date),
//                                 style: const TextStyle(color: Colors.grey),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     )