import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;

  const AdaptativeTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      required this.onSubmitted,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
            ),
          )
        : TextField(
            controller: controller,
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