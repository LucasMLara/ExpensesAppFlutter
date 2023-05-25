import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controler;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;

  const AdaptativeTextField(
      {super.key,
      required this.controler,
      required this.keyboardType,
      required this.onSubmitted,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controler,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            placeholder: label,
          )
        : TextField(
            controller: controler,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}




/**
 * controller: _valueController,
  keyboardType:
      const TextInputType.numberWithOptions(decimal: true),
  onSubmitted: (_) => _submitForm(),
  decoration: const InputDecoration(
    labelText: 'Valor (R\$)',
  ),
 */