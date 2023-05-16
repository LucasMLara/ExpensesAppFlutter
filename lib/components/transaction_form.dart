import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value);
  }

  _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            onSubmitted: (_) => _submitForm(),
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            controller: valueController,
            decoration: const InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Text('Nenhuma Data selecionada!'),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text('Selecionar Data'),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: _submitForm,
                  // style:
                  //     // https://www.flutterbeads.com/text-button-color-in-flutter/
                  //     TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: const Text('Nova Transação')),
            ],
          )
        ]),
      ),
    );
  }
}
