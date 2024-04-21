import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final bool obscureText;
  final String labelText; // Ajout du texte pour le champ de texte
  final bool isNumber ;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final void Function()? onTapIcon;
  
  const TextInput({
    Key? key,
    required this.obscureText,
    required this.labelText, // Ajout du paramètre labelText
    required this.myController,
    required this.valid,
    this.onTapIcon, required this.isNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      obscureText: obscureText,
      controller: myController,
      decoration: InputDecoration(
        labelText: labelText, // Utilisation du labelText dans InputDecoration
        
        contentPadding:const EdgeInsets.fromLTRB(15, 5, 10, 5),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        disabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}
