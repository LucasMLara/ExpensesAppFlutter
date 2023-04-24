import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tenis de Corrida',
        value: 350,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 500, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrasactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
