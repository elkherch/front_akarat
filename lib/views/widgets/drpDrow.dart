import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownAjoute extends StatelessWidget {
  final String value;
  final void Function(String?)? onChanged;
  final List<String> values;
  final List<String> labels;

  const DropDownAjoute({
    required this.value,
    required this.onChanged,
    required this.values,
    required this.labels,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.black),
        ),
      ),
      value: value,
      items: List.generate(
        values.length,
        (index) => DropdownMenuItem(
          value: values[index],
          child: Text(labels[index]), // Utilisation de value pour accéder au contenu de l'élément List
        ),
      ),
      onChanged: onChanged,
    );
  }
}
